<template>
  <div>
    <span :class="{'text-success': isHeaderFocus}" style="font-weight: bold;">{{title}}</span>
  </div>
</template>

<script>
export default {
  props: ["title"],
  computed: {
    focusRow() {
      return this.$store.getters.rightPanelFocusRow;
    },
    isHeaderFocus() {
      return this.focusRow == `${this.title.toLowerCase()}-0`;
    }
  }
};
</script>

<style lang="scss" scoped>
</style>