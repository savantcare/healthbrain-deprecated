<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Recommendation Card</span>
        <div style="float: right">
          <el-button type="text" size="mini" @click="showAddRecommendationDialog">A</el-button>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
export default {
  methods: {
    showAddRecommendationDialog() {
      console.log("open add dialog");
      this.$store.commit("showAddRecommendationModal");
    }
  }
};
</script>

<style lang="scss" scoped>
</style>