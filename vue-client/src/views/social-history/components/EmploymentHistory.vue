<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Emplo</span>
        <span class="hl-label">y</span>ment history
        <el-button
          style="float: right;"
          type="primary"
          icon="el-icon-plus"
          circle
          size="mini"
          @click="dialogVisible = true"
        ></el-button>
      </div>
      <el-table :data="tableData" height="200" style="width: 100%" size="mini">
        <el-table-column prop="date" label="Date"></el-table-column>
        <el-table-column prop="description" label="Description"></el-table-column>
      </el-table>
    </el-card>

    <el-dialog
      title="Add EmploymentHistory"
      :visible.sync="dialogVisible"
      width="30%"
      append-to-body
    >
      <label for>Description:</label>
      <el-input type="textarea" :autosize="{ minRows: 2, maxRows: 4}" placeholder="Please input" />
      <div style="width: 90%; margin-top: 12px;">
        <label for>Date:</label>
        <date-picker v-model="date"></date-picker>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">Cancel</el-button>
        <el-button type="primary" @click="dialogVisible = false">Save</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import DatePicker from "@/components/custom/DatePicker";
export default {
  components: {
    DatePicker
  },
  data() {
    return {
      tableData: [
        {
          date: "2016-05-03",
          description: "Description - 1"
        },
        {
          date: "2016-05-02",
          description: "Description - 2"
        },
        {
          date: "2016-05-04",
          description: "Description - 3"
        },
        {
          date: "2016-05-01",
          description: "Description - 4"
        },
        {
          date: "2016-05-08",
          description: "Description - 5"
        }
      ],
      dialogVisible: false,
      date: ""
    };
  }
};
</script>

<style lang="scss" scoped>
</style>