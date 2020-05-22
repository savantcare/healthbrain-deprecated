<template>
  <div style="display: flex; justify-content: space-between">
    <div style="cursor: pointer;" @click="gotoPrevPage">
      <div v-if="currentPage > 1">
        <b-icon-arrow-left></b-icon-arrow-left>
        <span>Prev</span>
      </div>
    </div>
    <div style="cursor:pointer;" @click="gotoNextPage">
      <div v-if="currentPage < pageCount">
        <span>Next</span>
        <b-icon-arrow-right></b-icon-arrow-right>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["title"],
  computed: {
    currentPage() {
      return this.$parent.currentPage;
    },
    pageCount() {
      return this.$parent.pageCount;
    }
  },
  methods: {
    gotoPrevPage() {
      this.$parent.gotoPrevPage();
    },
    gotoNextPage() {
      this.$parent.gotoNextPage();
    }
  }
};
</script>

<style lang="scss" scoped>
</style>