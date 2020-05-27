<template>
  <div style="text-align: center;">
    <el-autocomplete
      class="inline-input"
      v-model="keyword"
      :fetch-suggestions="querySearch"
      :trigger-on-focus="false"
      placeholder="Please Input"
      prefix-icon="el-icon-search"
      @select="handleSelect"
      clearable
    ></el-autocomplete>
  </div>
</template>

<script>
import {
  ADD_RECOMMENDATION,
  MULTIPLE_CHANGE_RECOMMENDATION,
  SOCIAL_HISTORY
} from "@/const.js";
export default {
  data() {
    return {
      keyword: "",
      componentList: [
        {
          value: "Add Recommendation",
          key: ADD_RECOMMENDATION
        },
        {
          value: "Multi change recommendation",
          key: MULTIPLE_CHANGE_RECOMMENDATION
        },
        {
          value: "Social History",
          key: SOCIAL_HISTORY
        }
      ]
    };
  },
  mounted() {},
  methods: {
    querySearch(queryString, cb) {
      let results = [];
      if (queryString.length == 0) {
        results = [];
      }

      results = this.componentList.filter(item => {
        return item.value.toLowerCase().search(queryString) > -1;
      });

      cb(results);
    },
    handleSelect(item) {
      const { key } = item;
      if (key == ADD_RECOMMENDATION) {
        const addRecommendationTab = {
          label: "Add Recommendation",
          value: require("./AddRecommendation.vue").default,
          name: "tab-add-recommendation"
        };
        this.$store.commit("addNewTab", addRecommendationTab);
      } else if (key == MULTIPLE_CHANGE_RECOMMENDATION) {
        const multiChangeRecommendationTab = {
          label: "Multi change recommendation",
          value: require("./MultiChangeRecommendation").default,
          name: "tab-multi-change-recommendation"
        };
        this.$store.commit("addNewTab", multiChangeRecommendationTab);
      } else if (key == SOCIAL_HISTORY) {
        const socialHistoryTab = {
          label: "Social History",
          value: require("./social-history/Index").default,
          name: "tab-social-history"
        };
        this.$store.commit("addNewTab", socialHistoryTab);
      }
    }
  }
};
</script>

<style lang="scss">
</style>