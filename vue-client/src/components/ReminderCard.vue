<template>
  <div>
    <b-card
      :border-variant="getStyle()"
      :header="getStyle()"
      :header-bg-variant="getStyle()"
      header-text-variant="white"
      id="reminderCard"
    >
      <template v-slot:header>
        <b-row align-h="between" style="height: 30px">
          <card-header title="Reminder"></card-header>
          <card-header-actions actions="[A,M,F]"></card-header-actions>
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
                <CardDataRowActions actions="[C,D]" :item="item" />
              </td>
            </tr>
          </tbody>
        </table>
      </b-card-text>
    </b-card>
  </div>
</template>

<script>
import CardHeader from "./ui_components/CardHeader";
import CardHeaderActions from "./ui_components/CardHeaderActions";
import CardDataRowActions from "./ui_components/CardDataRowActions";
export default {
  name: "reminder",
  components: { CardHeader, CardHeaderActions, CardDataRowActions },
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
