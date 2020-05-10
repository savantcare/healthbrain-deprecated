<template>
  <b-container fluid>
    <Split style="height: 100vh;" @onDrag="onDrag">
      <SplitArea :size="70" :minsize="100">
        <recommendation-panel></recommendation-panel>
        <reminder-panel></reminder-panel>
      </SplitArea>
      <SplitArea :size="30" :minsize="100">
        <!-- <recommendation-card></recommendation-card>
        <reminder-card></reminder-card>-->
        <div v-if="rightPanelComponents.length > 0">
          <component
            v-for="(component, index) in rightPanelComponents"
            :key="`component-${index}`"
            :is="component.value"
          ></component>
        </div>

        <search-box ref="search_box" @renderRightPanel="renderRightPanel"></search-box>
      </SplitArea>
    </Split>

    <tab-dialog></tab-dialog>
  </b-container>
</template>

<script>
import RecommendationPanel from "@/components/RecommendationPanel.vue";
import ReminderPanel from "@/components/ReminderPanel.vue";
import SearchBox from "@/components/SearchBox.vue";
import TabDialog from "@/components/TabDialog.vue";

// Right panel components
import RecommendationCard from "@/components/RecommendationCard.vue";
import ReminderCard from "@/components/ReminderCard.vue";
import CombinationCard from "@/components/CombinationCard.vue";

export default {
  name: "Home",
  components: {
    RecommendationPanel,
    ReminderPanel,
    SearchBox,
    TabDialog,
    // Right panel components
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
    }
  },
  beforeCreate() {
    // Initialize rightPanel components
    const list = [
      { key: "recommendation", value: RecommendationCard },
      { key: "reminder", value: ReminderCard },
      { key: "combination", value: CombinationCard }
    ];

    this.$store.commit("setRightPanelList", list);
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

