<template>
  <div @mouseover="mouseOver = true" @mouseleave="mouseOver = false">
    <span>{{title}}</span>
    <div style="float: right" v-if="showActions">
      <el-button
        type="text"
        size="mini"
        @click="$emit('multiDiscontinue')"
        v-if="selected.length > 0"
      >D</el-button>
      <div v-else>
        <el-button type="text" size="mini" @click="$emit('showAddDialog')">A</el-button>
        <el-button type="text" size="mini" @click="$emit('showMultiChangeDialog')">M</el-button>
        <el-button type="text" size="mini" @click="$emit('focusPanel')">F</el-button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["title", "actions", "type"],
  data() {
    return {
      mouseOver: false,
      selected: []
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
    showActions() {
      return this.mouseOver || this.isHeaderFocus;
    }
  },
  methods: {},
  mounted() {}
};
</script>

<style lang="scss" scoped>
</style>