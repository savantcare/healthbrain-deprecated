<template>
  <div>
    <b-button
      size="sm"
      variant="outline-primary"
      @click.prevent="openEditModal()"
      v-b-tooltip.hover.bottom="'Change'"
      v-if="showEditButton"
    >C</b-button>
    <b-button
      variant="outline-danger"
      @click="discontinueRecommendation()"
      class="ml-2"
      size="sm"
      v-b-tooltip.hover.bottom="'Discontinue'"
      v-if="showDiscontinueButton"
    >D</b-button>
  </div>
</template>

<script>
export default {
  props: ["item", "actions"],
  computed: {
    showEditButton() {
      return this.actions.indexOf("C") > -1;
    },
    showDiscontinueButton() {
      return this.actions.indexOf("D") > -1;
    }
  },
  methods: {
    openEditModal() {
      this.$parent.$parent.openEditModal(this.item);
    },
    discontinueRecommendation() {
      this.$parent.discontinueRecommendation(this.item);
    }
  }
};
</script>

<style lang="scss" scoped>
</style>