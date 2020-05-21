<template>
  <div>
    <b-card>
      <template v-slot:header>
        <b-row align-h="between" style="height: 30px">
          <card-header title="Reminder"></card-header>
          <card-header-actions actions="[A,M,F]"></card-header-actions>
        </b-row>
      </template>

      <b-card-text>
        <DataViewTable :data="tableData" />
      </b-card-text>
    </b-card>
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
import CardHeader from "@/components/ui/CardHeader";
import CardHeaderActions from "@/components/ui/CardHeaderActions";
import DataViewTable from "@/components/ui/DataViewTable/Implementaion.vue";
export default {
  name: "RemindersPanel",
  components: { CardHeader, CardHeaderActions, DataViewTable },
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
      reminders: []
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
    },
    tableData() {
      const rows = this.$store.getters.reminders;
      return [
        {
          label: "Yours",
          columns: [
            {
              label: "Description",
              field: "description"
            },
            {
              label: "Created At",
              field: "createdAt"
            }
          ],
          rows: rows,
          actions: ["C", "D"]
        },
        {
          label: "Other's",
          columns: [
            {
              label: "Description",
              field: "description"
            },
            {
              label: "Created At",
              field: "createdAt"
            }
          ],
          rows: rows,
          actions: ["C"]
        },
        {
          label: "Custom",
          columns: [
            {
              label: "Description",
              field: "description"
            },
            {
              label: "Created At",
              field: "createdAt"
            }
          ],
          rows: rows,
          actions: ["D"]
        }
      ];
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
      const addReminderTab = require("@/components/tab/AddReminderTab.vue");
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
      const addReminderTab = require("@/components/tab/AddReminderTab.vue");
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
      const tab = require("@/components/tab/MultiChangeReminderTab.vue");
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
