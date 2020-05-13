<template>
  <b-tab>
    <template v-slot:title>
      Multi change recommendation
      <b-button size="sm" variant="danger" @click="closeTab">x</b-button>
    </template>
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

    <b-row cols="3" align-h="around">
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
    },
    pageCount() {
      return Math.ceil(this.items.length / 3);
    },
    recommendations() {
      let list = [];
      this.items.forEach(item => {
        list.push({
          id: item["id"],
          description: item["description"],
          createdAt: item["createdAt"],
          patientId: item["patientId"]
        });
      });

      let start = (this.currentPage - 1) * 3;
      let end = this.currentPage * 3;
      let totalCount = list.length;

      if (totalCount < end) {
        const offset = end - totalCount;
        start = start - offset;
        end = totalCount;
      }

      return list.slice(start, end);
    }
  },
  data() {
    return {
      currentPage: 1
    };
  },
  mounted() {
    console.log(this.pageCount);
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
    },
    gotoPrevPage() {
      this.currentPage -= 1;
    },
    gotoNextPage() {
      this.currentPage += 1;
    }
  }
};
</script>

<style scoped>
</style>