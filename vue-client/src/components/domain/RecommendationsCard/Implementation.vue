<template>
  <div>
    <b-card id="recommendationCard">
      <template v-slot:header>
        <CardHeader title="Recommendation" actions="[A,M,F,D]" type="card" />
      </template>
      <DataViewTable :data="tableData" title="recommendation" type="card" />
    </b-card>
  </div>
</template>

<script>
import CardHeader from "@/components/ui/CardHeader";
import DataViewTable from "@/components/ui/DataViewTable/Implementaion.vue";
export default {
  name: "recommendation",
  components: {
    CardHeader,
    DataViewTable
  },
  data() {
    return {
      selected: []
    };
  },
  computed: {
    tableData() {
      const rows = this.$store.getters.recommendations;
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
    },
    items() {
      return this.$store.getters.recommendations;
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
    this.$store.dispatch("getRecommendations", {
      patientId: this.id,
      toast: this.$bvToast
    });
  },
  methods: {
    onRowSelected(items) {
      this.selected = items;
    },
    showAddModal() {
      this.$store.commit("showAddRecommendationModal");
    },
    showMultiChangeModal() {
      this.$store.commit("showMultiChangeRecommendationModal");
    },
    openEditModal(item) {
      this.$store.commit("showEditRecommendationsModal", item);
    },
    discontinueRecommendation(item) {
      this.$store.dispatch("discontinueRecommendation", {
        data: item,
        toast: this.$bvToast
      });
      this.$store.dispatch("updateRightPanelRow");
    },
    multiDiscontinue() {
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
    },
    getRowStyleClass(row) {
      const { originalIndex } = row;
      if (this.focusRow == `${this.$options.name}-${originalIndex + 1}`) {
        return "table-primary";
      }
      return "";
    },
    selectionChanged(params) {
      this.selected = params.selectedRows;
    }
  }
};
</script>

<style>
#recommendationCard {
  cursor: pointer;
}
</style>
