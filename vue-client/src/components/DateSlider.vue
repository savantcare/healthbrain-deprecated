<template>
  <div>
    <div
      class="mb-2"
      style="margin-left: 30px; margin-right: 30px; display: flex; align-items: center;"
    >
      <b-icon-caret-left style="cursor: pointer;" @click="moveToPrevDate"></b-icon-caret-left>
      <ejs-slider
        id="ticks"
        :min="minVal"
        :max="maxVal"
        :value="value"
        :tooltip="tooltip"
        :ticks="ticks"
        v-on:renderingTicks="onRenderingTicks"
        v-on:tooltipChange="onTooltipChange"
      ></ejs-slider>
      <b-icon-caret-right style="cursor: pointer;" @click="moveToNextDate"></b-icon-caret-right>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tooltip: { placement: "Before", isVisible: true },
      minVal: new Date("2013-06-13").getTime(),
      maxVal: new Date("2013-06-21").getTime(),
      value: new Date("2013-06-15").getTime(),
      stepVal: 86400000,
      // Slider ticks customization
      ticks: { placement: "After", largeStep: 3 * 86400000 }
    };
  },
  mounted() {
    // Init dates
    const today = new Date();
    this.minVal = new Date(
      today.getTime() - 15 * 24 * 60 * 60 * 1000
    ).getTime();
    this.value = today.getTime();
    this.maxVal = new Date(
      today.getTime() + 15 * 24 * 60 * 60 * 1000
    ).getTime();

    let custom = { year: "numeric", month: "short", day: "numeric" };
    const formatDate = today.toLocaleDateString("en-us", custom);
    this.$store.commit("setLeftPanelCurrentDate", formatDate);
  },
  methods: {
    onTooltipChange(args) {
      let totalMiliSeconds = Number(args.text);
      // Convert the current milliseconds to the respective date in desired format
      let custom = { year: "numeric", month: "short", day: "numeric" };
      const formatDate = new Date(totalMiliSeconds).toLocaleDateString(
        "en-us",
        custom
      );
      args.text = formatDate;
      this.$store.commit("setLeftPanelCurrentDate", formatDate);

      this.$store.commit(
        "setRecommendationCurrentDate",
        new Date(totalMiliSeconds)
      );
    },
    onRenderingTicks(args) {
      let totalMiliSeconds = Number(args.value);
      // Convert the current milliseconds to the respective date in desired format
      let custom = { year: "numeric", month: "short", day: "numeric" };
      args.text = new Date(totalMiliSeconds).toLocaleDateString(
        "en-us",
        custom
      );
    },
    moveToNextDate() {
      this.maxVal = new Date(this.maxVal + 24 * 60 * 60 * 1000).getTime();
      this.minVal = new Date(this.minVal + 24 * 60 * 60 * 1000).getTime();
    },
    moveToPrevDate() {
      this.maxVal = new Date(this.maxVal - 24 * 60 * 60 * 1000).getTime();
      this.minVal = new Date(this.minVal - 24 * 60 * 60 * 1000).getTime();
    }
  }
};
</script>

<style scoped>
@import "../../node_modules/@syncfusion/ej2-base/styles/material.css";
@import "../../node_modules/@syncfusion/ej2-buttons/styles/material.css";
@import "../../node_modules/@syncfusion/ej2-popups/styles/material.css";
@import "../../node_modules/@syncfusion/ej2-inputs/styles/material.css";
#app {
  height: 40px;
  position: absolute;
  width: 98%;
}
.wrap {
  box-sizing: border-box;
  height: 260px;
  margin: 0 auto;
  padding: 30px 10px;
  width: 460px;
}
</style>