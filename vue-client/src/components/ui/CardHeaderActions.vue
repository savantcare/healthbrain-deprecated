<template>
  <div>
    <b-row class="mr-2">
      <b-button
        v-if="showAddButton"
        @click="showAddModal"
        size="sm"
        v-b-tooltip.hover.bottom="'Add'"
        variant="primary"
      >A</b-button>
      <b-button
        v-if="showMultiChangeButton"
        variant="primary"
        v-b-tooltip.hover.bottom="'Multi change'"
        class="ml-2"
        size="sm"
        @click="showMultiChangeModal"
      >M</b-button>
      <b-button
        v-if="showFocusButton"
        variant="primary"
        v-b-tooltip.hover.bottom="'Focus'"
        class="ml-2"
        size="sm"
      >F</b-button>
      <b-button
        v-if="showDiscontinueButton"
        v-b-tooltip.hover.bottom="'Discontinue'"
        variant="danger"
        @click="multiDiscontinue"
      >D</b-button>
    </b-row>
  </div>
</template>

<script>
export default {
  props: ["actions"],
  computed: {
    showAddButton() {
      return this.actions.indexOf("A") > -1 && this.$parent.selected.length < 1;
    },
    showMultiChangeButton() {
      return this.actions.indexOf("M") > -1 && this.$parent.selected.length < 1;
    },
    showFocusButton() {
      return this.actions.indexOf("F") > -1 && this.$parent.selected.length < 1;
    },
    showDiscontinueButton() {
      return this.actions.indexOf("D") > -1 && this.$parent.selected.length > 0;
    }
  },
  methods: {
    showAddModal() {
      this.$parent.showAddModal();
    },
    showMultiChangeModal() {
      this.$parent.showMultiChangeModal();
    },
    multiDiscontinue() {
      this.$parent.multiDiscontinue();
    }
  }
};
</script>

<style lang="scss" scoped>
</style>