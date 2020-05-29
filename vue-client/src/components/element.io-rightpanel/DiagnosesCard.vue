<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Diagnosis</span>
        <div style="float: right">
          <el-button type="text" size="mini" @click="showAddDiagnosisDialog">A</el-button>
          <el-button type="text" size="mini" @click="showMultiChangeAssessmentDialog">C</el-button>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
export default {
  methods: {
    showAddDiagnosisDialog() {
      console.log("open add dialog");
      this.$store.commit("showAddDiagnosisModal");
    },
    showMultiChangeAssessmentDialog() {
      console.log("open add dialog");
      this.$store.commit("showMultiChangeAssessmentModal");
    }
  }
};
</script>

<style lang="scss" scoped>
</style>