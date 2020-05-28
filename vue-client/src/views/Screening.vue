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
import AddScreeningTab from "@/components/element.io-tab/AddScreening";
import MultiChangeScreeningTab from "@/components/element.io-tab/MultiChangeScreening";
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