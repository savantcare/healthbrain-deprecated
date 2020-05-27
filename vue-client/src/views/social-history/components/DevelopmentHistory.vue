<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span class="hl-label">D</span>evelopment history
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
      title="Add DevelopmentHistory"
      :visible.sync="dialogVisible"
      width="30%"
      append-to-body
    >
      <label for>Description:</label>
      <el-input type="textarea" :autosize="{ minRows: 2, maxRows: 4}" placeholder="Please input" />
      <div style="width: 90%; margin-top: 12px;">
        <label for>Date:</label>
        <el-input placeholder="Please input " clearable></el-input>
        <el-date-picker type="date" :picker-options="pickerOptions"></el-date-picker>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">Cancel</el-button>
        <el-button type="primary" @click="dialogVisible = false">Save</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
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
      pickerOptions: {
        shortcuts: [
          {
            text: "Today",
            onClick(picker) {
              picker.$emit("pick", new Date());
            }
          },
          {
            text: "Yesterday",
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24);
              picker.$emit("pick", date);
            }
          },
          {
            text: "A week ago",
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
              picker.$emit("pick", date);
            }
          }
        ]
      }
    };
  }
};
</script>

<style lang="scss" scoped>
</style>