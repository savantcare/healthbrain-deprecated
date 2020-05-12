<template>
  <div>
    <b-card
      :border-variant="isStyle1 ? 'info' : 'dark'"
      :header="isStyle1 ? 'info' : 'dark'"
      :header-bg-variant="isStyle1 ? 'info' : 'dark'"
      header-text-variant="white"
      title="Other component"
    >
      <b-card-text>This is other component</b-card-text>
    </b-card>
  </div>
</template>

<script>
import { STYLE_1 } from "@/const.js";
export default {
  computed: {
    isStyle1() {
      return this.style == STYLE_1;
    }
  }
};
</script>

<style lang="scss" scoped>
</style>