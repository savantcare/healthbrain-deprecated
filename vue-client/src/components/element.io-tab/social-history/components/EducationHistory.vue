<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span class="hl-label">E</span>ducation history
        <el-button
          style="float: right;"
          type="primary"
          icon="el-icon-plus"
          circle
          size="mini"
          @click="dialogVisible = true"
        ></el-button>
      </div>
      <el-table
        :data="tableData"
        height="200"
        style="width: 100%"
        size="mini"
        :row-style="handleRowStyle"
      >
        <el-table-column prop="date" label="Date"></el-table-column>
        <el-table-column prop="description" label="Description"></el-table-column>
      </el-table>
    </el-card>

    <el-dialog
      title="Add Education History"
      :visible.sync="dialogVisible"
      width="30%"
      append-to-body
    >
      <el-form :model="form" :rules="rules" ref="form" label-width="120px" class="demo-ruleForm">
        <el-form-item label="Description" prop="description">
          <el-input type="textarea" v-model="form.description"></el-input>
        </el-form-item>

        <el-form-item label="Date" prop="date" style="width: 90%">
          <date-picker v-model="form.date"></date-picker>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="submitForm('form')">Save</el-button>
          <el-button type="primary" @click="submitForm('form')">Add one more</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import DatePicker from "@/components/custom/DatePicker";
import { uuid } from "uuidv4";
export default {
  components: {
    DatePicker
  },
  data() {
    return {
      dialogVisible: false,
      date: "",
      form: {
        description: "",
        date: ""
      },
      description: "",
      rules: {
        description: [
          {
            required: true,
            message: "Please input description",
            trigger: "blur"
          }
        ],
        date: [
          {
            required: false,
            message: "Please input date",
            trigger: "blur"
          }
        ]
      }
    };
  },
  computed: {
    historyData() {
      return this.$store.state.socialHistory.history;
    },
    tableData() {
      return this.$store.state.socialHistory.history.educationHistory;
    }
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          this.form["isNew"] = true;
          this.form["uuid"] = uuid();
          let tableData = this.tableData;
          tableData.push(this.form);
          this.historyData["educationHistory"] = tableData;
          this.$store.commit("setSocialHistoryData", this.historyData);
          this.form = {
            description: "",
            date: ""
          };
          this.$emit("updateValidateChanges", {
            field: "educationHistory",
            value: false
          });
          this.dialogVisible = false;
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    handleRowStyle(object) {
      const { row } = object;
      if (row.isNew) {
        return { "background-color": "#fdf5e6" };
      }
    }
  }
};
</script>

<style lang="scss" scoped>
</style>