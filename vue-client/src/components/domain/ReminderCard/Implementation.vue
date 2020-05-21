<template>
  <div>
    <b-card id="reminderCard">
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
import CardHeader from "@/components/ui/CardHeader";
import CardHeaderActions from "@/components/ui/CardHeaderActions";
import DataViewTable from "@/components/ui/DataViewTable/Implementaion.vue";
export default {
  name: "reminder",
  components: { CardHeader, CardHeaderActions, DataViewTable },
  data() {
    return {
      selected: [],
      showEditModal: false
    };
  },
  computed: {
    items() {
      return this.$store.state.reminder.list.filter(item => {
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
    style() {
      return this.$store.getters.style;
    },
    focusRow() {
      return this.$store.getters.rightPanelFocusRow;
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
      this.$store.commit("showAddReminderModal");
    },
    showMultiChangeModal() {
      this.$store.commit("showMultiChangeReminderModal");
    },
    openEditModal(item) {
      this.$store.commit("showEditReminderModal", item);
    },
    discontinueReminder(item) {
      this.$store.dispatch("discontinueReminder", {
        data: item,
        toast: this.$bvToast
      });
      this.$store.dispatch("updateRightPanelRow");
    },
    multidiscontinue() {
      let selectedIds = [];
      let selectedDatas = [];

      this.selected.forEach(item => {
        selectedIds.push(item.id);
        selectedDatas.push(item);
      });
      this.selected = [];

      this.$store.dispatch("multidiscontinueReminder", {
        selectedIds: selectedIds,
        selectedDatas: selectedDatas,
        toast: this.$bvToast
      });
      this.$store.dispatch("updateRightPanelRow");
    },
    getStyle() {
      if (this.focusRow == `${this.$options.name}-0`) {
        return "success";
      }
      return this.style;
    },
    selectTableRow(item) {
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
      if (this.focusRow == `${this.$options.name}-${index + 1}`) {
        return true;
      }
      return false;
    },
    focusPanel() {
      console.log("focus panel");
    }
  }
};
</script>

<style>
#reminderCard {
  cursor: pointer;
}
</style>
