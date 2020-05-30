<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <TableHeader
        title="Recommendations"
        actions="A,M,F,D"
        type="card"
        @showAddDialog="showAddDialog"
        @showMultiChangeDialog="showMultiChangeDialog"
        @focusPanel="focusPanel"
        @multiDiscontinue="multiDiscontinue"
        ref="table_header"
      />
    </div>
    <DataTable
      :tabData="tabData"
      @handleSelectionChange="handleSelectionChange"
      @handleEdit="handleEdit"
      @handleDelete="handleDelete"
    />
  </el-card>
</template>

<script>
import TableHeader from "@/components/common/TableHeader";
import DataTable from "@/components/common/DataTable";
export default {
  components: {
    TableHeader,
    DataTable
  },
  data() {
    return {
      selectedRows: []
    };
  },
  methods: {
    showAddDialog() {
      console.log("show add dialog");
      this.$store.commit("showAddRecommendationModal");
    },
    showMultiChangeDialog() {
      this.$store.commit("showMultiChangeRecommendationModal");
    },
    focusPanel() {
      console.log("focus panel");
    },
    multiDiscontinue() {
      let selectedIds = [];
      this.selectedRows.forEach(item => {
        selectedIds.push(item.id);
      });
      this.$store.dispatch("multidiscontinueRecommendation", {
        selectedIds: selectedIds,
        notify: this.$notify,
        selectedDatas: this.selectedRows
      });
    },
    handleSelectionChange(value) {
      this.$refs.table_header.selected = value;
      this.selectedRows = value;
    },
    handleEdit(data) {
      console.log("show edit dialog");
      this.$store.commit("showEditRecommendationsModal", data);
    },
    handleDelete(data) {
      this.$store.dispatch("discontinueRecommendation", {
        data: data,
        toast: this.$notify
      });
    }
  },
  mounted() {
    const params = {
      patientId: this.$route.query.patient_id,
      notify: this.$notify
    };
    this.$store.dispatch("getRecommendations", params);
  },
  computed: {
    tabData() {
      const recList = this.$store.state.recommendation.list;
      return [
        {
          label: "Yours",
          tableData: recList,
          columns: [
            {
              label: "Description",
              field: "description",
              sortable: true
            },
            {
              label: "Created At",
              field: "createdAt",
              sortable: true
            }
          ],
          rowActions: ["C", "D"]
        },
        {
          label: "Other's",
          tableData: recList,
          columns: [
            {
              label: "Description",
              field: "description",
              sortable: true
            },
            {
              label: "Created At",
              field: "createdAt",
              sortable: true
            }
          ],
          rowActions: ["C", "D"],
          selectedColumn: ["description"]
        }
      ];
    }
  }
};
</script>

<style lang="scss" scoped>
</style>