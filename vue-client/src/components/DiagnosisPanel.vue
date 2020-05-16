<template>
  <div>
    <b-card
      :border-variant="isStyle1 ? 'info' : 'dark'"
      :header="isStyle1 ? 'info' : 'dark'"
      :header-bg-variant="isStyle1 ? 'info' : 'dark'"
      header-text-variant="white"
    >
      <template v-slot:header>
        <b-row align-h="between" :style="{height: isStyle1 ? '50px' : '30px'}">
          <h5 v-if="isStyle1" class="m-md-2">Diagnosis</h5>
          <span style="font-weight: bold;" v-else>Diagnosis</span>
          <b-row class="mr-2">
            <b-button
              variant="primary"
              size="sm"
              v-if="selected.length == 0"
              @click="showAddModal"
            >A</b-button>
            <b-button
              size="sm"
              variant="primary"
              v-if="selected.length == 0"
              @click="showMultiChangeModal"
              class="ml-2"
            >M</b-button>
            <b-button
              variant="danger"
              v-if="selected.length > 0"
              @click="multidiscontinue"
            >D</b-button>
          </b-row>
        </b-row>
      </template>
      <b-card-text>
        <b-table
          ref="selectableTable"
          selectable
          bordered
          select-mode="multi"
          :items="items"
          @row-selected="onRowSelected"
          responsive="sm"
          :fields="fields"
          :small="!isStyle1"
        >
          <template v-slot:cell(action)="item">
            <b-button
              :size="isStyle1 ? '' :'sm'"
              variant="outline-primary"
              @click="openEditModal(item)"
            >C</b-button>
            <b-button
              variant="outline-danger"
              @click="discontinueReminder(item)"
              class="ml-2"
              :size="isStyle1 ? '' : 'sm'"
            >D</b-button>
          </template>
        </b-table>
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

    <b-modal v-model="multiChangeModalShow" centered size="lg" title="Reminder multi change">
      <b-row cols="3">
        <b-col v-for="(item, index) in Diagnosis" :key="`item-${index}`">
          <label>Description:</label>

          <b-form-textarea id="textarea-state" rows="5" autofocus v-model="item.description"></b-form-textarea>
          <b-form-invalid-feedback>Description content is required.</b-form-invalid-feedback>

          <b-button
            class="float-right mb-2 mt-2"
            variant="primary"
            size="sm"
            @click="update(item)"
          >Save</b-button>
        </b-col>
      </b-row>
    </b-modal>
  </div>
</template>

<script>
import uniqid from "uniqid";
import {
  ADD_DIALOG,
  STYLE_1,
  ADD_REMINDER,
  EDIT_REMINDER,
  MULTIPLE_CHANGE_REMINDER
} from "@/const.js";

export default {
  name: "ReminderPanel",
  data() {
    return {
      modalShow: false,
      data: {
        description: ""
      },
      selected: [],
      modalType: ADD_DIALOG, // 1: add, 2: edit
      timer: -1,
      multiChangeModalShow: false,
      Diagnosis: []
    };
  },
  computed: {
    validation() {
      return this.data.description.length > 0;
    },
    modalTitle() {
      return this.modalType == ADD_DIALOG ? "Add Reminder" : "Edit Reminder";
    },
    items() {
      return this.$store.state.reminder.list.filter(item => {
        return item.patientId == this.id && item.discontinue != true;
      });
    },
    fields() {
      if (this.selected.length > 0) {
        return ["description", "createdAt"];
      } else {
        return ["description", "createdAt", "action"];
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
    }
  },
  mounted() {
    this.$store.dispatch("getDiagnosis", {
      patientId: this.id,
      toast: this.$bvToast
    });
  },
  methods: {
    onRowSelected(items) {
      this.selected = items;
    },
    showAddModal() {
      const addReminderTab = require("@/components/tab_components/AddReminderTab.vue");
      this.$store.commit("setTabList", [
        { key: ADD_REMINDER, value: addReminderTab.default }
      ]);
      this.$store.commit("setReminderTabType", ADD_REMINDER);
      this.$store.commit("setTabDialogVisibility", true);
    },
    save() {
      if (this.modalType == ADD_DIALOG) {
        const today = new Date();
        this.data["createdAt"] = today.toDateString();
        this.data["id"] = uniqid();
        this.data["patientId"] = this.id;

        this.$store.dispatch("addReminder", {
          data: this.data,
          toast: this.$bvToast
        });
      } else {
        this.$store.dispatch("updateReminder", {
          data: this.data,
          toast: this.$bvToast
        });
      }
      this.modalShow = false;
    },
    openEditModal(object) {
      const { item } = object;
      const data = {
        id: item["id"],
        description: item["description"],
        createdAt: item["createdAt"],
        patientId: item["patientId"]
      };
      const addReminderTab = require("@/components/tab_components/AddReminderTab.vue");
      this.$store.commit("setTabList", [
        { key: ADD_REMINDER, value: addReminderTab.default }
      ]);
      this.$store.commit("setTabDialogVisibility", true);
      this.$store.commit("setReminderTabType", EDIT_REMINDER);
      this.$store.commit("setReminderData", data);
    },
    discontinueReminder(item) {
      this.$store.dispatch("discontinueReminder", {
        data: item.item,
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

      this.$store.dispatch("multidiscontinueReminder", {
        selectedIds: selectedIds,
        selectedDatas: selectedDatas,
        toast: this.$bvToast
      });
    },
    getStyleClass() {
      return this.style == STYLE_1 ? "info" : "dark";
    },
    showMultiChangeModal() {
      const tab = require("@/components/tab_components/MultiChangeReminderTab.vue");
      this.$store.commit("setTabList", [
        { key: MULTIPLE_CHANGE_REMINDER, value: tab.default }
      ]);
      this.$store.commit("setReminderTabType", MULTIPLE_CHANGE_REMINDER);
      this.$store.commit("setTabDialogVisibility", true);
    }
  },
  beforeDestroy() {
    clearInterval(this.timer);
  }
};
</script>

<style>
</style>
