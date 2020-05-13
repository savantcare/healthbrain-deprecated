<template>
  <div>
    <b-card
      :border-variant="getStyle()"
      :header="getStyle()"
      :header-bg-variant="getStyle()"
      header-text-variant="white"
      id="recommendationCard"
      @click="setFocusComponent"
    >
      <template v-slot:header>
        <b-row align-h="between" :style="{height: isStyle1 ? '50px' : '30px'}">
          <h5 v-if="isStyle1" class="m-md-2">Recommendation Card</h5>
          <span style="font-weight: bold;" v-else>Recommendation</span>
          <b-row class="mr-2">
            <b-button
              size="sm"
              variant="primary"
              v-if="selected.length == 0"
              @click="showAddModal"
              v-b-tooltip.hover.bottom="'Add recommendation'"
            >A</b-button>
            <b-button
              variant="primary"
              v-if="selected.length == 0"
              @click="showMultiChangeModal"
              class="ml-2"
              size="sm"
              v-b-tooltip.hover.bottom="'Multi change recommendation'"
            >M</b-button>
            <b-button
              variant="primary"
              v-if="selected.length == 0"
              class="ml-2"
              size="sm"
              v-b-tooltip.hover.bottom="'Focus to recommendation'"
              v-scroll-to="{
                el: '#recommendation',
                container: '#leftPanel',
                duration: 500,
                easing: 'linear',
                offset: -200,
                force: true,
                cancelable: true,
                onStart: focusPanel,
                x: false,
                y: true
              }"
            >F</b-button>
            <b-button variant="danger" v-if="selected.length > 0" @click="multidiscontinue">D</b-button>
          </b-row>
        </b-row>
      </template>
      <b-card-text>
        <table class="table table-bordered table-sm table-hover">
          <thead>
            <tr>
              <th v-for="(field, index) in fields" :key="`field-${index}`" scope="col">{{field}}</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(item, index) in items"
              :key="`item-${index}`"
              style="cursor: pointer;"
              :class="{'table-active': checkActiveStatus(item), 'table-primary': checkFocusStatus(index)}"
            >
              <td @click="selectTableRow(item)">{{item.description}}</td>
              <td @click="selectTableRow(item)">{{new Date(item.createdAt).toDateString()}}</td>
              <td v-if="selected.length == 0">
                <b-button
                  :size="isStyle1 ? '' :'sm'"
                  variant="outline-primary"
                  @click="openEditModal(item, $event)"
                  v-b-tooltip.hover.bottom="'Change'"
                >C</b-button>
                <b-button
                  variant="outline-danger"
                  @click="discontinueRecommendation(item)"
                  class="ml-2"
                  :size="isStyle1 ? '' : 'sm'"
                  v-b-tooltip.hover.bottom="'Discontinue'"
                >D</b-button>
              </td>
            </tr>
          </tbody>
        </table>
      </b-card-text>
    </b-card>
  </div>
</template>

<script>
import uniqid from "uniqid";
import {
  ADD_DIALOG,
  STYLE_1,
  ADD_RECOMMENDATION,
  EDIT_RECOMMENDATION,
  MULTIPLE_CHANGE_RECOMMENDATION
} from "@/const.js";

export default {
  name: "RecommendationCard",
  components: {},
  data() {
    return {
      modalShow: false,
      data: {
        description: ""
      },
      selected: [],
      modalType: ADD_DIALOG, // 1: add, 2: edit
      timer: -1,
      focusIndex: -1,
      discontinueAction: false,

      showEditModal: false
    };
  },
  computed: {
    validation() {
      return this.data.description.length > 0;
    },
    modalTitle() {
      return this.modalType == ADD_DIALOG
        ? "Add Recommendation"
        : "Edit Recommendation";
    },
    items() {
      return this.$store.state.recommendation.list.filter(item => {
        return item.patientId == this.id && item.discontinue != true;
      });
    },
    fields() {
      if (this.selected.length > 0) {
        return ["Description", "Created At"];
      } else {
        return ["Description", "Created At", "Action"];
      }
    },
    id() {
      return this.$route.query.patient_id;
    },
    isStyle1() {
      return this.style == STYLE_1;
    },
    modalDialogButton() {
      return this.modalType == ADD_DIALOG ? "Save" : "Update";
    },
    style() {
      return this.$store.state.setting.style;
    },
    focusComponent() {
      return this.$store.state.focusComponent;
    },
    rightPanelComponents() {
      return this.$store.state.rightPanel.list;
    }
  },
  watch: {
    focusComponent() {
      this.focusIndex = 0;
    }
  },
  mounted() {
    this.$store.dispatch("getRecommendations", {
      patientId: this.id,
      toast: this.$bvToast
    });

    window.addEventListener("keydown", this.keyHandler);
  },
  methods: {
    onRowSelected(items) {
      this.selected = items;
    },
    showAddModal() {
      const addRecommendationTab = require("@/components/tab_components/AddRecommendationTab.vue");
      this.$store.commit("setTabList", [
        { key: ADD_RECOMMENDATION, value: addRecommendationTab.default }
      ]);
      this.$store.commit("setRecommendationTabType", ADD_RECOMMENDATION);
      this.$store.commit("setTabDialogVisibility", true);
    },
    showMultiChangeModal() {
      const tab = require("@/components/tab_components/MultiChangeRecommendationTab.vue");
      this.$store.commit("setTabList", [
        { key: MULTIPLE_CHANGE_RECOMMENDATION, value: tab.default }
      ]);
      this.$store.commit(
        "setRecommendationTabType",
        MULTIPLE_CHANGE_RECOMMENDATION
      );
      this.$store.commit("setTabDialogVisibility", true);
    },
    save() {
      if (this.modalType == ADD_DIALOG) {
        const today = new Date();
        this.data["createdAt"] = today.toDateString();
        this.data["id"] = uniqid();
        this.data["patientId"] = this.id;

        this.$store.dispatch("addRecommendation", {
          data: this.data,
          toast: this.$bvToast
        });
      } else {
        this.$store.dispatch("updateRecommendation", {
          data: this.data,
          toast: this.$bvToast
        });
      }
      this.modalShow = false;
    },
    openEditModal(item) {
      const data = {
        id: item["id"],
        description: item["description"],
        createdAt: item["createdAt"],
        patientId: item["patientId"],
        recommendationID: item["recommendationID"]
      };
      const addRecommendationTab = require("@/components/tab_components/AddRecommendationTab.vue");
      this.$store.commit("setTabList", [
        { key: ADD_RECOMMENDATION, value: addRecommendationTab.default }
      ]);
      this.$store.commit("setTabDialogVisibility", true);
      this.$store.commit("setRecommendationTabType", EDIT_RECOMMENDATION);
      this.$store.commit("setRecommendationData", data);
    },
    discontinueRecommendation(item) {
      this.discontinueAction = true;
      this.$store.dispatch("discontinueRecommendation", {
        data: item,
        toast: this.$bvToast
      });
    },
    multidiscontinue() {
      let selectedIds = [];
      let selectedDatas = [];

      this.selected.forEach(item => {
        selectedIds.push(item.id);
        selectedDatas.push(item);
      });
      this.selected = [];

      this.$store.dispatch("multidiscontinueRecommendation", {
        selectedIds: selectedIds,
        selectedDatas: selectedDatas,
        toast: this.$bvToast
      });
    },
    getStyleClass() {
      return this.style == STYLE_1 ? "info" : "dark";
    },
    keyHandler(e) {
      if (this.focusComponent != "recommendation" || this.modalShow == true) {
        return;
      }

      /* This code seems similar across 100 components. Should this be put into a seperate function and then called from 100 components?
        **decision-to-make**
        Each component will implement its own keyboard shortcuts. so 
         Reminders will have following card header actions
            a -> to add
         Date of birth will not have card header actions
         Recommendations will have:
            a -> to add
            d -> download as pdf
      */
      if (e.key == "a") {
        this.showAddModal();
      } else if (e.key == "c") {
        this.showEditModal = true;
      } else if (e.key == "ArrowDown") {
        if (this.focusIndex < 1 + this.items.length) {
          this.focusIndex += 1;
        } else {
          this.moveFocusToNextComponent();
        }
      } else if (e.key == "ArrowUp") {
        if (this.focusIndex > 1) {
          this.focusIndex -= 1;
        } else {
          this.moveFocusToPrevComponent();
        }
      } else if (e.key == "ArrowLeft") {
        this.moveFocusToPrevComponent();
      } else if (e.key == "ArrowRight") {
        this.moveFocusToNextComponent();
      } else if (e.key == "e") {
        const rowIndex = this.focusIndex - 2;
        if (rowIndex > -1) {
          this.openEditModal(this.items[rowIndex]);
        }
      } else if (e.key == "d") {
        const rowIndex = this.focusIndex - 2;
        if (rowIndex > -1) {
          this.discontinueRecommendation(this.items[rowIndex]);
        }
      }
    },
    moveFocusToNextComponent() {
      // move focus to the next component
      const nextComponent = this.rightPanelComponents[
        this.getCurrentComponentIndex() + 1
      ];

      if (nextComponent == null) {
        // set focus to the search-box
        setTimeout(() => {
          this.$store.commit("setFocusComponent", "search-box");
        }, 50);
      } else {
        setTimeout(() => {
          this.$store.commit("setFocusComponent", nextComponent["key"]);
        }, 50);
      }
    },

    moveFocusToPrevComponent() {
      // move focus to the top component
      if (this.getCurrentComponentIndex() == 0) {
        // set focus to the search-box
        setTimeout(() => {
          this.$store.commit("setFocusComponent", "search-box");
        }, 50);
      } else {
        const prevComponent = this.rightPanelComponents[
          this.getCurrentComponentIndex() - 1
        ];
        setTimeout(() => {
          this.$store.commit("setFocusComponent", prevComponent["key"]);
        }, 50);
      }
    },

    getCurrentComponentIndex() {
      let currentComponentIndex = -1;
      this.rightPanelComponents.forEach((item, index) => {
        if (item.key == "recommendation") {
          currentComponentIndex = index;
        }
      });
      return currentComponentIndex;
    },
    getStyle() {
      if (this.focusComponent == "recommendation") {
        return this.focusIndex > 1 ? "warning" : "success";
      }
      return this.isStyle1 ? "info" : "dark";
    },
    selectTableRow(item) {
      if (this.modalShow || this.discontinueAction) {
        this.discontinueAction = false;
        return;
      }

      let newList = [];
      let isExistsRow = false;
      this.selected.forEach(data => {
        if (data.id == item.id) {
          isExistsRow = true;
        } else {
          newList.push(data);
        }
      });
      if (isExistsRow) {
        this.selected = newList;
      } else {
        this.selected.push(item);
      }
    },
    checkActiveStatus(item) {
      let isActive = false;
      this.selected.forEach(data => {
        if (data.id == item.id) {
          isActive = true;
        }
      });
      return isActive;
    },
    checkFocusStatus(index) {
      if (index + 2 == this.focusIndex) {
        return true;
      }
      return false;
    },
    setFocusComponent() {
      this.$store.commit("setFocusComponent", "recommendation");
      this.focusIndex = 0;
    },
    focusPanel() {
      console.log("focus panel");
    }
  },
  beforeDestroy() {
    clearInterval(this.timer);
    window.removeEventListener("keydown", this.keyHandler);
  }
};
</script>

<style>
#recommendationCard {
  cursor: pointer;
}
</style>
