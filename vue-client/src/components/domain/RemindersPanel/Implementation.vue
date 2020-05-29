@@ -1,186 +0,0 @@
<template>
  <div id="reminder-panel">
    <b-card>
      <template v-slot:header>
        <CardHeader title="Reminder" actions="[A,M,F,D]" />
      </template>

      <b-card-text>
        <DataViewTable :data="tableData" />
      </b-card-text>
    </b-card>
  </div>
</template>

<script>
import CardHeader from "@/components/ui/CardHeader";
import DataViewTable from "@/components/ui/DataViewTable/Implementaion.vue";
export default {
  name: "reminder-panel",
  components: { CardHeader, DataViewTable },
  data() {
    return {
      selected: [],
      updateStatus: 0 // Value for monitor the update status of panel.
    };
  },
  computed: {
    items() {
      return this.$store.getters.panelReminders;
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
    style() {
      if (this.updateStatus > 0) {
        return "success";
      }
      return this.$store.getters.style;
    },
    itemCount() {
      return this.items.length;
    },
    tableData() {
      const rows = this.$store.getters.reminders;
      return [
        {
          label: "Yours",
          columns: [
            {
              label: "Description",
              field: "description",
              responsiveness_priority: 1
            },
            {
              label: "Created At",
              field: "createdAt",
              responsiveness_priority: 2
            },
            {
              label: "",
              field: "action",
              responsiveness_priority: 3,
              display: "on-row-active"
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
              field: "description",
              responsiveness_priority: 1
            },
            {
              label: "Created At",
              field: "createdAt",
              responsiveness_priority: 2
            },
            {
              label: "",
              field: "action",
              responsiveness_priority: 3,
              display: "on-row-active"
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
              field: "description",
              responsiveness_priority: 1
            },
            {
              label: "Created At",
              field: "createdAt",
              responsiveness_priority: 2
            },
            {
              label: "",
              field: "action",
              responsiveness_priority: 3,
              display: "on-row-active"
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
  watch: {
    itemCount() {
      this.updateStatus = 1;
      setTimeout(() => {
        this.updateStatus = 0;
      }, 2000);
    }
  },
  methods: {
    onRowSelected(item) {
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
    showAddModal() {
      this.$store.commit("showAddReminderModal");
    },
    openEditModal(item) {
      this.$store.commit("showEditRemindersModal", item);
    },
    discontinueItem(item) {
      this.$store.dispatch("discontinueReminder", {
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
      this.$store.dispatch("multidiscontinueReminder", {
        selectedIds: selectedIds,
        selectedDatas: selectedDatas,
        toast: this.$bvToast
      });
    },
    showMultiChangeModal() {
      this.$store.commit("showMultiChangeReminderModal");
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
    getFormatDate(date) {
      let custom = { year: "numeric", month: "short", day: "numeric" };
      return new Date(date).toLocaleDateString("en-us", custom);
    }
  },
  beforeDestroy() {
    clearInterval(this.timer);
  }
};
</script>

<style>
</style>