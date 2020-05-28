<template>
  <el-dialog :visible.sync="visibility" custom-class="multi-tab-dialog" width="90%" top="5vh">
    <el-tabs type="border-card">
      <el-tab-pane>
        <span slot="label">
          {{title}}
          <el-button type="primary" size="mini" style="padding: 2px;">Reviewed: {{lastViewDate}}</el-button>
        </span>

        <SocialHistoryTab @closeDialog="closeDialog" />
      </el-tab-pane>
    </el-tabs>
  </el-dialog>
</template>

<script>
import SocialHistoryTab from "@/components/element.io-tab/social-history/Index.vue";
export default {
  components: {
    SocialHistoryTab
  },
  data() {
    return {
      visibility: true,
      title: "Social history",
      editableTabsValue: "1",
      lastViewDate: "Jan 15th 20"
    };
  },
  methods: {
    closeDialog() {
      this.visibility = false;
    }
  }
};
</script>

<style lang="scss">
.mr-2 {
  margin-right: 12px;
}
.hl-label {
  color: #409eff;
}
.mt-2 {
  margin-top: 12px;
}
.multi-tab-dialog {
  .el-dialog__header {
    display: none;
  }
  .el-dialog__body {
    padding-top: 12px;
  }
}
.el-date-editor.el-input {
  width: 0px;
}
.el-input--prefix .el-input__inner {
  visibility: hidden;
}
</style>