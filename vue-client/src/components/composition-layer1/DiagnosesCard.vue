<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Diagnoses</span>
        <div style="float: right">
          <el-button type="text" size="mini" @click="showAddDiagnosisDialog">A</el-button>
          <el-button type="text" size="mini" @click="showMultiChangeAssessmentDialog">M</el-button>
          <el-popover
            placement="bottom"
            width="200"
            trigger="click">
            <el-select
              v-model="diagnosesData.selectedColumn"
              size="mini"
              clearable
              multiple
              placeholder="Select"
              collapse-tags
            >
              <el-option
                v-for="item in diagnosesData.columns"
                :key="item.field"
                :label="item.label"
                :value="item.field"
              ></el-option>
            </el-select>
            <i slot="reference" class="el-icon-s-tools settingsIcon"></i>
          </el-popover>
        </div>
      </div>
      <DataTableWithoutTab :dataToDisplay="diagnosesData" @handleSelectionChange="handleSelectionChange" />
    </el-card>
  </div>
</template>

<script>

//import TableHeader from "@/components/common/TableHeader";
import DataTableWithoutTab from "@/components/common/DataTableWithoutTab";
export default {
  components: {
    DataTableWithoutTab
  },
  data() {
    return {
      drawer: false,
      direction: 'rtl',
      diagnosesData: 
        {
          label: "Yours",
          tableData: [
            {
              name: 'Bacterial intestinal infection, unspecified',
              addedBy: 'Dr. Sonia P',
              addedOn: 'Apr 27, 2020',
              currentAssessment: 'Current assessment for this diagnosis',
              assessments: [
                {
                  content: 'Current assessment for this diagnosis',
                  timestamp: 'May 25, 2020',
                  size: 'large',
                  type: 'primary',
                }, 
                {
                  content: 'Previous assessment for this diagnosis',
                  timestamp: 'May 14, 2020',
                  type: 'primary'
                }, 
                {
                  content: 'First assessment for this diagnosis',
                  timestamp: 'Apr 27, 2020',
                  type: 'success'
                }
              ]
            }, 
            {
              name: 'Adjustment disorder, With depressed mood',
              addedBy: 'Dr. Sonia P',
              addedOn: 'Apr 22, 2020',
              currentAssessment: 'Current assessment for this diagnosis',
              assessments: [
                {
                    content: 'Current assessment for this diagnosis',
                    timestamp: 'May 25, 2020',
                    size: 'large',
                    type: 'primary',
                }, 
                {
                    content: 'First assessment for this diagnosis',
                    timestamp: 'Apr 22, 2020',
                    type: 'success'
                }]
            }, 
            {
              name: 'Generalized anxiety disorder',
              addedBy: 'Dr. Sonia P',
              addedOn: 'Mar 22, 2020',
              currentAssessment: 'Current assessment for this diagnosis',
              assessments: [{
                    content: 'Current assessment for this diagnosis',
                    timestamp: 'Apr 02, 2020',
                    size: 'large',
                    type: 'primary',
                }, {
                    content: 'First assessment for this diagnosis',
                    timestamp: 'Mar 22, 2020',
                    type: 'success'
                }]
            }],
          columns: [
            {
              label: "Diagnosis",
              field: "name",
              sortable: true
            },
            {
              label: "Added By",
              field: "addedBy",
              sortable: true
            },
            {
              label: "Added On",
              field: "addedOn",
              sortable: true
            }
          ],
          rowActions: ["C", "D"],
          selectedColumn: ["name"]
        }
    };
  },
  methods: {
    showAddDiagnosisDialog() {
      console.log("open add dialog");
      this.$store.commit("showAddDiagnosisModal");
    },
    showMultiChangeAssessmentDialog() {
      console.log("open add dialog");
      this.$store.commit("showMultiChangeAssessmentModal");
    },
    focusPanel() {
      console.log("focus panel");
    },
    multiDiscontinue() {
      console.log("multi-discontinue");
    },
    handleSelectionChange(value) {
      this.$refs.table_header.selected = value;
    }
  },
  mounted() {}
};
</script>

<style lang="scss" scoped>
.settingsIcon{
  float:right; color:#409EFF; cursor:pointer; padding: 5px;
}
</style>