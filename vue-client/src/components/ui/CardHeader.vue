<template>
  <div>
    <b-row align-h="between" @mouseover="mouseOver = true" @mouseleave="mouseOver = false">
      <span :class="{'text-success': isHeaderFocus}" style="font-weight: bold;">{{title}}</span>

      <b-row class="mr-2" v-if="headerActionVisibility">
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
    </b-row>
  </div>
</template>

<script>
export default {
  props: ["title", "actions", "type"],
  data() {
    return {
      mouseOver: false
    };
  },
  computed: {
    focusRow() {
      return this.$store.getters.rightPanelFocusRow;
    },
    isHeaderFocus() {
      return (
        this.focusRow == `${this.title.toLowerCase()}-0` && this.type == "card"
      );
    },
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
    },
    headerActionVisibility() {
      return this.mouseOver || this.isHeaderFocus;
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