<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Service statements</span>
        <div style="float: right">
          <el-button type="text" size="mini" @click="showAddServiceStatementsDialog">A</el-button>
          <el-button type="text" size="mini" @click="showMultiChangeServiceStatementsDialog">C</el-button>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
export default {
  methods: {
    showAddServiceStatementsDialog() {
      console.log("open add dialog");
      this.$store.commit("showAddServiceStatementsModal");
    },
    showMultiChangeServiceStatementsDialog() {
      console.log("open multi change dialog");
      this.$store.commit("showMultiChangeServiceStatementsModal");
    }
  }
};
</script>

<style lang="scss" scoped>
</style>