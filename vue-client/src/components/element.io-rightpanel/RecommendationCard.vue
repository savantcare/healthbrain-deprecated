<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <TableHeader
        title="Recommendation"
        actions="A,M,F,D"
        type="card"
        @showAddDialog="showAddDialog"
        @showMultiChangeDialog="showMultiChangeDialog"
        @focusPanel="focusPanel"
        @multiDiscontinue="multiDiscontinue"
        ref="table_header"
      />
    </div>
    <DataTable :tabData="tabData" @handleSelectionChange="handleSelectionChange" />
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
      tabData: [
        {
          label: "Yours",
          tableData: [
            {
              description:
                "Recommendation 1-xxxx   xxx  xxxxxxx  aasdf   asdfasdf asdfa sdfxxxxxxxxxx",
              createdAt: "29th May, 2020",
              id: 1
            },
            {
              description: "Recommendation 2",
              createdAt: "29th May, 2020",
              id: 2
            }
          ],
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
        },
        {
          label: "Other's",
          tableData: [
            {
              description: "Recommendation 3",
              createdAt: "29th May, 2020",
              id: 3
            },
            {
              description: "Recommendation 4",
              createdAt: "29th May, 2020",
              id: 4
            }
          ],
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
        }
      ]
    };
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
    }
  },
  mounted() {}
};
</script>

<style lang="scss" scoped>
</style>