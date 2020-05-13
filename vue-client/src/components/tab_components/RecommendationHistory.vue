<template>
  <div class="mb-2 mt-2" v-if="history.length > 0">
    <h5>History:</h5>
    <b-list-group>
      <b-list-group-item v-for="(item, index) in pageHistory" :key="`history-${index}`">
        {{item.content}}
        <br />
        <small>{{item.info}}</small>
      </b-list-group-item>
    </b-list-group>
    <b-pagination
      v-model="currentPage"
      :total-rows="rows"
      :per-page="perPage"
      align="center"
      class="mt-2"
      size="sm"
      v-if="rows > 1"
    ></b-pagination>
  </div>
</template>

<script>
import { RECOMMENDATION_API_URL } from "@/const.js";
export default {
  props: ["id"],
  data() {
    return {
      history: [],
      currentPage: 1,
      perPage: 3
    };
  },
  computed: {
    recommendations() {
      return this.$store.state.recommendation.list;
    },
    rows() {
      return this.history.length;
    },
    pageHistory() {
      const start = (this.currentPage - 1) * this.perPage;
      const end = this.currentPage * this.perPage;
      return this.history.slice(start, end);
    }
  },
  mounted() {
    this.getHistory();
  },
  methods: {
    async getHistory() {
      const TOKEN = localStorage.getItem("token");
      const response = await fetch(
        RECOMMENDATION_API_URL + "/getHistory/" + this.id,
        {
          headers: {
            "Content-Type": "application/json;charset=utf-8",
            Authorization: "Bearer " + TOKEN
          }
        }
      );
      this.history = await response.json();
    }
  }
};
</script>

<style lang="scss" scoped>
</style>