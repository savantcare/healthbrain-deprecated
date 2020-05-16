<template>
  <div>
    <Split style="height: 100vh;" @onDrag="onDrag">
      <SplitArea :size="70" :minsize="100" id="leftPanel">
        <left-panel-header></left-panel-header>
        <div id="leftPanelContainer">
          <div id="leftPanelContent">
            <div v-if="leftPanelComponents.length > 0">
              <component
                :is="component"
                v-for="(component, index) in leftPanelComponents"
                :key="`left-component-${index}`"
              ></component>
            </div>
            <!-- <b-row cols="4" style="margin-left: 1px;">
              <b-col v-for="i in 32" :key="i" style="padding: 0px;">
                <test-panel></test-panel>
              </b-col>
            </b-row>
            <b-pagination total-rows="32" align="center" per-page="16" aria-controls="my-table"></b-pagination>-->
          </div>
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
const DiagnosisPanel = () =>
  import("@/components/DiagnosisPanel.vue");
const ReminderPanel = () => import("@/components/ReminderPanel.vue");
const LeftPanelHeader = () => import("@/components/LeftPanelHeader.vue");
const DateSlider = () => import("@/components/DateSlider.vue");
const TestPanel = () => import("@/components/LeftPanelTestComponent.vue");

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
    DiagnosisPanel,
    LeftPanelHeader,
    DateSlider,
    TestPanel,

    // Right panel components
    SearchBox,
    RecommendationCard,
    ReminderCard,
    CombinationCard
  },
  data() {
    return {
      searchKeyword: "",
      leftPanelWidth: 70
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
      { key: "reminder", value: ReminderCard }
      // { key: "combination", value: CombinationCard }
    ];

    this.$store.commit("setRightPanelList", rightPanelList);

    // Initialize leftPanel components
    // const leftPanelList = [RecommendationPanel, ReminderPanel];
    // this.$store.commit("setLeftPanelList", leftPanelList);
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
    this.$store.commit("setRightPanelFocusRowIndex", -1);

    this.updateRightPanelRows();
  },
  methods: {
    onDrag(size) {
      const rightSize = size[1];
      this.$store.commit("setRightPanelWidth", `calc(${rightSize}% - 4px) `);
      this.leftPanelWidth = size[0];
    },
    keydownHandler(event) {
      /**
       * Global Key-Handler for Right-Panel components
       */
      let { focusRowIndex } = this.$store.state.rightPanel;
      const { rows, searchKeyword } = this.$store.state.rightPanel;

      /**
       * Exception where make the Global key-handler not working.
       */
      if (searchKeyword.length > 0) {
        return;
      }

      if (event.key == "`") {
        // Set focus to the <search-box>
        focusRowIndex = rows.length - 1;
        // this.$refs.search_box.setFocus();
        this.$store.commit("setRightPanelFocusRowIndex", focusRowIndex);
      } else if (event.key == "ArrowDown") {
        if (focusRowIndex == rows.length - 1) {
          focusRowIndex = 0;
        } else {
          focusRowIndex += 1;
        }
        this.$store.commit("setRightPanelFocusRowIndex", focusRowIndex);
      } else if (event.key == "ArrowUp") {
        if (focusRowIndex == 0) {
          focusRowIndex = rows.length - 1;
        } else {
          focusRowIndex -= 1;
        }
        this.$store.commit("setRightPanelFocusRowIndex", focusRowIndex);
      }

      const focusRow = rows[focusRowIndex];
      if (focusRow == null) {
        return;
      }

      /**
       * Card component <Row> actions
       */
      const info = focusRow.split("-");
      const component = info[0];
      const index = info[1];
      const { visibility } = this.$store.state.tabDialog;
      if (visibility == true) {
        return;
      }
      if (index > 0) {
        if (event.key == "c") {
          if (component == "recommendation") {
            const { recommendations } = this.$store.getters;
            const selectedItem = recommendations[index - 1];
            this.$store.commit("showEditRecommendationsModal", selectedItem);
          } else if (component == "reminder") {
            const { reminders } = this.$store.getters;
            const selectedItem = reminders[index - 1];
            this.$store.commit("showEditReminderModal", selectedItem);
          }
        } else if (event.key == "d") {
          if (component == "recommendation") {
            const { recommendations } = this.$store.getters;
            const selectedItem = recommendations[index - 1];
            this.$store.dispatch("discontinueRecommendation", {
              data: selectedItem,
              toast: this.$bvToast
            });
          } else if (component == "reminder") {
            const { reminders } = this.$store.getters;
            const selectedItem = reminders[index - 1];
            this.$store.dispatch("discontinueReminder", {
              data: selectedItem,
              toast: this.$bvToast
            });
          }
          this.updateRightPanelRows();
        }
        return;
      }

      /**
       * Card components <Header> actions
       */
      if (event.key == "a") {
        if (component == "recommendation") {
          this.$store.commit("showAddRecommendationModal");
        } else if (component == "reminder") {
          this.$store.commit("showAddReminderModal");
        }
      } else if (event.key == "m") {
        if (component == "recommendation") {
          this.$store.commit("showMultiChangeRecommendationModal");
        } else if (component == "reminder") {
          this.$store.commit("showMultiChangeReminderModal");
        }
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
      this.updateRightPanelRows();
    },
    updateRightPanelRows() {
      this.$store.dispatch("updateRightPanelRow");
    }
  },
  beforeDestroy() {
    window.removeEventListener("keydown", this.keydownHandler);
  }
};
</script>

<style scoped>
</style>