<template>
  <el-dialog :visible.sync="dialogVisible" width="80%">
    <el-tabs type="card">
      <!--Start Multi Change recommendation-->
      <el-tab-pane>
        <span slot="label" style="font-size:22px">Multi change recommendation</span>
        <MultiChangeRecommendationTab />
      </el-tab-pane>
      <!--End Multi Change recommendation-->

      <!--Start Multi Change recommendation-->
      <el-tab-pane>
        <span slot="label" style="font-size:22px">Add recommendation</span>
        <AddRecommendationTab />
      </el-tab-pane>
      <!--End Multi Add recommendation-->
    </el-tabs>
  </el-dialog>
</template>   
<script>
import AddRecommendationTab from "@/components/element.io-tab/AddRecommendation";
import MultiChangeRecommendationTab from "@/components/element.io-tab/MultiChangeRecommendation";
export default {
  components: {
    AddRecommendationTab,
    MultiChangeRecommendationTab
  },
  data() {
    return {
      dialogVisible: true
    };
  },
  methods: {}
};
</script>