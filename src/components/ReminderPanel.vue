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
          <h5 v-if="isStyle1" class="m-md-2">Reminder Panel</h5>
          <span style="font-weight: bold;" v-else>Reminder Panel</span>
          <b-row class="mr-2">
            <b-button variant="primary" v-if="selected.length == 0" @click="showAddModal">Add</b-button>
            <b-button
              variant="danger"
              v-if="selected.length > 0"
              @click="multidiscontinue"
            >discontinue</b-button>
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
            >Edit</b-button>
            <b-button
              variant="outline-danger"
              @click="discontinueReminder(item)"
              class="ml-2"
              :size="isStyle1 ? '' : 'sm'"
            >discontinue</b-button>
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
  </div>
</template>

<script>
import uniqid from "uniqid";
import { ADD_DIALOG, STYLE_1 } from "@/const.js";

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
      timer: -1
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
      return this.$store.state.style.value;
    }
  },
  mounted() {
    this.$store.dispatch("getReminders", {
      patientId: this.id,
      toast: this.$bvToast
    });
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

        this.$store.dispatch("saveReminder", {
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
    openEditModal(item) {
      this.data = {
        id: this.items[item.index]["id"],
        description: this.items[item.index]["description"],
        createdAt: this.items[item.index]["createdAt"],
        patientId: this.items[item.index]["patientId"]
      };
      this.modalShow = true;
      this.modalType = 2;
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
    }
  },
  beforeDestroy() {
    clearInterval(this.timer);
  }
};
</script>

<style>
</style>
