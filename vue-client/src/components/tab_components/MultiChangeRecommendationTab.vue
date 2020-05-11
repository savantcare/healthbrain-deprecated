<template>
  <b-tab>
    <template v-slot:title>
      Multi change recommendation
      <b-button size="sm" variant="danger" @click="closeTab">x</b-button>
    </template>
    <b-row cols="3">
      <b-col v-for="(item, index) in recommendations" :key="`item-${index}`">
        <label>Description:</label>

        <b-form-textarea id="textarea-state" rows="5" autofocus v-model="item.description"></b-form-textarea>
        <b-form-invalid-feedback>Description content is required.</b-form-invalid-feedback>

        <b-button
          class="float-right mb-2 mt-2"
          variant="primary"
          size="sm"
          @click="update(item)"
        >Save</b-button>
      </b-col>
    </b-row>
  </b-tab>
</template>

<script>
import { MULTIPLE_CHANGE_RECOMMENDATION } from "@/const.js";
export default {
  computed: {
    items() {
      return this.$store.state.recommendation.list.filter(item => {
        return item.patientId == this.id && item.discontinue != true;
      });
    },
    id() {
      return this.$route.query.patient_id;
    },
    tabList() {
      return this.$store.state.tabDialog.tabList;
    }
  },
  data() {
    return {
      recommendations: []
    };
  },
  mounted() {
    this.items.forEach(item => {
      this.recommendations.push({
        id: item["id"],
        description: item["description"],
        createdAt: item["createdAt"],
        patientId: item["patientId"]
      });
    });
  },
  methods: {
    update(item) {
      this.$store.dispatch("updateRecommendation", {
        data: item,
        toast: this.$bvToast
      });
    },
    closeTab() {
      const newList = this.tabList.filter(item => {
        return item.key != MULTIPLE_CHANGE_RECOMMENDATION;
      });
      this.$store.commit("setTabList", newList);
    }
  }
};
</script>

<style lang="scss" scoped>
</style>