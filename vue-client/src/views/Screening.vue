<template>
  <el-dialog :visible.sync="dialogVisible" width="80%">
    <el-tabs type="card">
      <!--Start Multi Change screening-->
      <el-tab-pane>
        <span slot="label" style="font-size:22px">Multi change screening</span>
        <MultiChangeScreeningTab />
      </el-tab-pane>
      <!--End Multi Change screening-->

      <!--Start Multi Change screening-->
      <el-tab-pane>
        <span slot="label" style="font-size:22px">Add screening</span>
        <AddScreeningTab />
      </el-tab-pane>
      <!--End Multi Add screening-->
    </el-tabs>
  </el-dialog>
</template>
<script>
import AddScreeningTab from "@/components/composition-layer2/AddScreening";
import MultiChangeScreeningTab from "@/components/composition-layer2/MultiChangeScreening";
export default {
  components: {
    AddScreeningTab,
    MultiChangeScreeningTab
  },
  data() {
    return {
      dialogVisible: true
    };
  },
  methods: {}
};
</script>