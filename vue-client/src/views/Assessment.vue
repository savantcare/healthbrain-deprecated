<template>
  <el-dialog
  :visible.sync="dialogVisible"
  width="80%"
  :before-close="handleClose">
    <el-tabs type="card">
      <!--Start Multi Change recommendation-->
      <el-tab-pane>
        <span slot="label" style="font-size:22px;font-family: Helvetica;">Multi change diagnosis assessment</span>
        <MultiChangeAssessmentTab />
      </el-tab-pane>
      <!--End Multi Change recommendation-->

      <!--Start Multi Change recommendation-->
      <el-tab-pane>
        <span slot="label" style="font-size:20px"> Add diagnosis</span>
        <AddDiagnosisTab />
      </el-tab-pane>
      
      <!--End Multi Add recommendation-->
    </el-tabs>

  </el-dialog>
</template>   
<script>
import AddDiagnosisTab from "@/components/element.io-tab/diagnosis/AddDiagnosis";
import MultiChangeAssessmentTab from "@/components/element.io-tab/diagnosis/MultiChangeAssessment";
export default {
  components: {
    AddDiagnosisTab,
    MultiChangeAssessmentTab
  },
  data() {
    return {
      dialogVisible: true
    };
  },
  methods: {
      handleClose(done) {
        done();
      }
  }
};
</script>