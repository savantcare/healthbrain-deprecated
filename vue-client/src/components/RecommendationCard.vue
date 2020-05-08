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
          <span style="font-weight: bold;" v-else>Recommendation Card</span>
          <b-row class="mr-2">
            <b-button variant="primary" v-if="selected.length == 0" @click="showAddModal">Add</b-button>
            <b-button
              variant="danger"
              v-if="selected.length > 0"
              @click="multidiscontinue"
            >Discontinue</b-button>
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
              @click="selectTableRow(item)"
              style="cursor: pointer;"
              :class="{'table-active': checkActiveStatus(item), 'table-primary': checkFocusStatus(index)}"
            >
              <td>{{item.description}}</td>
              <td>{{item.createdAt}}</td>
              <td v-if="selected.length == 0">
                <b-button
                  :size="isStyle1 ? '' :'sm'"
                  variant="outline-primary"
                  @click="openEditModal(item, $event)"
                >Edit</b-button>
                <b-button
                  variant="outline-danger"
                  @click="discontinueRecommendation(item)"
                  class="ml-2"
                  :size="isStyle1 ? '' : 'sm'"
                >Discontinue</b-button>
              </td>
            </tr>
          </tbody>
        </table>
      </b-card-text>
    </b-card>

    <b-modal v-model="modalShow" id="modal-center" centered :title="modalTitle">
      <b-form @submit.stop.prevent>
        <label>Description:</label>

        <b-form-textarea
          id="textarea-state"
          v-model="data.description"
          :state="validation"
          rows="5"
          autofocus
        ></b-form-textarea>
        <b-form-invalid-feedback :state="validation">Description content is required.</b-form-invalid-feedback>
      </b-form>

      <template v-slot:modal-footer>
        <div class="float-right">
          <b-button size="sm" @click="modalShow=false">Close</b-button>
          <b-button
            class="ml-2"
            variant="primary"
            size="sm"
            @click="save"
            :disabled="!validation"
          >{{modalDialogButton}}</b-button>
        </div>
      </template>
    </b-modal>
  </div>
</template>

<script>
import uniqid from "uniqid";
import { ADD_DIALOG, STYLE_1 } from "@/const.js";

export default {
  name: "RecommendationCard",
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
      discontinueAction: false
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
      this.modalShow = true;
      this.modalType = ADD_DIALOG;
      this.data = { description: "" };
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
      this.data = {
        id: item["id"],
        description: item["description"],
        createdAt: item["createdAt"],
        patientId: item["patientId"]
      };
      this.modalShow = true;
      this.modalType = 2;
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
