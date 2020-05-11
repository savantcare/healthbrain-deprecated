<template>
  <div>
    <Split style="height: 100vh;" @onDrag="onDrag">
      <SplitArea :size="70" :minsize="100">
        <left-panel-header></left-panel-header>
        <div v-if="leftPanelComponents.length > 0">
          <component
            v-for="(component, index) in leftPanelComponents"
            :key="`left-component-${index}`"
            :is="component"
          ></component>
        </div>
      </SplitArea>
      <SplitArea :size="30" :minsize="100">
        <div v-if="rightPanelComponents.length > 0">
          <component
            v-for="(component, index) in rightPanelComponents"
            :key="`right-component-${index}`"
            :is="component.value"
          ></component>
        </div>

        <search-box ref="search_box" @renderRightPanel="renderRightPanel"></search-box>
      </SplitArea>
    </Split>

    <tab-dialog></tab-dialog>
  </div>
</template>

<script>
const TabDialog = () => import("@/components/TabDialog.vue");

// Left panel components
const RecommendationPanel = () =>
  import("@/components/RecommendationPanel.vue");
const ReminderPanel = () => import("@/components/ReminderPanel.vue");
const LeftPanelHeader = () => import("@/components/LeftPanelHeader.vue");

// Right panel components
const SearchBox = () => import("@/components/SearchBox.vue");
const RecommendationCard = () => import("@/components/RecommendationCard.vue");
const ReminderCard = () => import("@/components/ReminderCard.vue");
const CombinationCard = () => import("@/components/CombinationCard.vue");

export default {
  name: "Home",
  components: {
    TabDialog,
    // Left panel components
    RecommendationPanel,
    ReminderPanel,
    LeftPanelHeader,

    // Right panel components
    SearchBox,
    RecommendationCard,
    ReminderCard,
    CombinationCard
  },
  data() {
    return {
      searchKeyword: ""
    };
  },
  computed: {
    focusComponent() {
      return this.$store.state.focusComponent;
    },
    rightPanelComponents() {
      return this.$store.state.rightPanel.list;
    },
    leftPanelComponents() {
      return this.$store.state.leftPanel.list;
    }
  },
  beforeCreate() {
    // Initialize rightPanel components
    const rightPanelList = [
      { key: "recommendation", value: RecommendationCard },
      { key: "reminder", value: ReminderCard },
      { key: "combination", value: CombinationCard }
    ];

    this.$store.commit("setRightPanelList", rightPanelList);

    // Initialize leftPanel components
    const leftPanelList = [RecommendationPanel, ReminderPanel];
    this.$store.commit("setLeftPanelList", leftPanelList);
  },
  mounted() {
    this.$store.dispatch("loadSetting");
    // Join room
    const patientId = this.$route.query.patient_id;
    const role = this.$store.state.userRole;

    this.$socket.emit("CREATE_ROOM", `room-${patientId}-${role}`);

    // Get Keyevent
    window.addEventListener("keydown", this.keydownHandler);

    this.$store.commit("setFocusComponent", "");
  },
  methods: {
    onDrag(size) {
      const rightSize = Math.floor(size[1]);
      this.$store.commit("setRightPanelWidth", `${rightSize}% `);
    },
    keydownHandler(event) {
      if (event.key == "`") {
        this.$store.commit("setFocusComponent", "search-box");
        this.$refs.search_box.setFocus();
      }
    },
    renderRightPanel(action) {
      if (action == "clear") {
        this.$store.commit("setRightPanelList", []);
      } else if (action.search("recommendation") > -1) {
        const newList = [];
        this.rightPanelComponents.forEach(item => {
          if (item.key != "recommendation") {
            newList.push(item);
          }
        });
        newList.push({
          key: "recommendation",
          value: RecommendationCard
        });

        this.$store.commit("setRightPanelList", newList);
      } else if (action.search("reminder") > -1) {
        const newList = [];
        this.rightPanelComponents.forEach(item => {
          if (item.key != "reminder") {
            newList.push(item);
          }
        });
        newList.push({
          key: "reminder",
          value: ReminderCard
        });

        this.$store.commit("setRightPanelList", newList);
      }
    }
  },
  beforeDestroy() {
    window.removeEventListener("keydown", this.keydownHandler);
  }
};
</script>

