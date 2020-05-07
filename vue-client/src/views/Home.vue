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
        <component
          v-for="(component, index) in rightPanelComponents"
          :key="`component-${index}`"
          :is="component.value"
        ></component>

        <search-box ref="search_box" @renderRightPanel="renderRightPanel"></search-box>
      </SplitArea>
    </Split>
  </b-container>
</template>

<script>
import RecommendationCard from "@/components/RecommendationCard.vue";
import RecommendationPanel from "@/components/RecommendationPanel.vue";
import ReminderCard from "@/components/ReminderCard.vue";
import ReminderPanel from "@/components/ReminderPanel.vue";
import SearchBox from "@/components/SearchBox.vue";

export default {
  name: "Home",
  components: {
    RecommendationCard,
    RecommendationPanel,
    ReminderCard,
    ReminderPanel,
    SearchBox
  },
  data() {
    return {
      searchKeyword: "",
      rightPanelComponents: [
        { key: "recommendation", value: RecommendationCard },
        { key: "reminder", value: ReminderCard }
      ]
    };
  },
  computed: {},
  mounted() {
    this.$store.dispatch("loadSetting");
    // Join room
    const patientId = this.$route.query.patient_id;
    const role = this.$store.state.userRole;

    this.$socket.emit("CREATE_ROOM", `room-${patientId}-${role}`);

    // Get Keyevent
    window.addEventListener("keydown", this.keydownHandler);
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
        this.rightPanelComponents = [];
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

        this.rightPanelComponents = newList;
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

        this.rightPanelComponents = newList;
      }
      // if (this.rightPanelComponents.length > 0) {
      //   this.$store.commit(
      //     "setFocusComponent",
      //     this.rightPanelComponents[0].key
      //   );
      // }
    }
  },
  beforeDestroy() {
    window.removeEventListener("keydown", this.keydownHandler);
  }
};
</script>

