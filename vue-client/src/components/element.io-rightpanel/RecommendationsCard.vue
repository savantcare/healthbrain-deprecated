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
    return {};
  },
  methods: {
    showAddDialog() {
      console.log("show add dialog");
      this.$store.commit("showAddRecommendationModal");
    },
    showMultiChangeDialog() {
      console.log("show multi-change dialog");
    },
    focusPanel() {
      console.log("focus panel");
    },
    multiDiscontinue() {
      console.log("mult-discontinue");
    },
    handleSelectionChange(value) {
      this.$refs.table_header.selected = value;
    },
    handleEdit(data) {
      console.log("show edit dialog");
      this.$store.commit("showEditRecommendationsModal", data);
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