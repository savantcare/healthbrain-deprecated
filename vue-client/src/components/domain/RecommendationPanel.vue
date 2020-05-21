<template>
  <div id="recommendation-panel">
    <b-card>
      <template v-slot:header>
        <b-row align-h="between" style="height: 30px">
          <card-header title="Recommendation"></card-header>
          <card-header-actions actions="[A,M,F,D]"></card-header-actions>
        </b-row>
      </template>

      <b-card-text>
        <DataViewTable :data="tableData" />
      </b-card-text>
    </b-card>
  </div>
</template>

<script>
import CardHeader from "../ui/CardHeader";
import CardHeaderActions from "../ui/CardHeaderActions";
import DataViewTable from "../ui/DataViewTable/Implementaion.vue";
export default {
  name: "recommendation-panel",
  components: { CardHeader, CardHeaderActions, DataViewTable },
  data() {
    return {
      selected: [],
      updateStatus: 0 // Value for monitor the update status of panel.
    };
  },
  computed: {
    items() {
      return this.$store.getters.panelRecommendations;
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
      const rows = this.$store.getters.recommendations;
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
    this.$store.dispatch("getRecommendations", {
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
      this.$store.commit("showAddRecommendationModal");
    },
    openEditModal(item) {
      this.$store.commit("showEditRecommendationsModal", item);
    },
    discontinueRecommendation(item) {
      this.$store.dispatch("discontinueRecommendation", {
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

      this.$store.dispatch("multidiscontinueRecommendation", {
        selectedIds: selectedIds,
        selectedDatas: selectedDatas,
        toast: this.$bvToast
      });
    },
    showMultiChangeModal() {
      this.$store.commit("showMultiChangeRecommendationModal");
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
