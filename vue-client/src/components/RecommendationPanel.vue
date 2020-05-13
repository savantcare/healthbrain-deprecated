<template>
  <div id="recommendation">
    <b-card
      :border-variant="style"
      :header="style"
      :header-bg-variant="style"
      header-text-variant="white"
    >
      <template v-slot:header>
        <b-row align-h="between" style="height: 30px">
          <span style="font-weight: bold;">Recommendation Panel</span>
          <b-row class="mr-2">
            <b-button
              variant="primary"
              size="sm"
              v-if="selected.length == 0"
              @click="showAddModal"
            >Add</b-button>
            <b-button
              size="sm"
              variant="primary"
              v-if="selected.length == 0"
              @click="showMultiChangeModal"
              class="ml-2"
            >Multi change</b-button>
            <b-button
              variant="danger"
              v-if="selected.length > 0"
              @click="multidiscontinue"
            >discontinue</b-button>
          </b-row>
        </b-row>
      </template>
      <b-card-text>
        <b-table
          ref="selectableTable"
          selectable
          bordered
          select-mode="multi"
          :items="items"
          @row-selected="onRowSelected"
          responsive="sm"
          :fields="fields"
          small
        >
          <template v-slot:cell(action)="item">
            <b-button size="sm" variant="outline-primary" @click="openEditModal(item)">Change</b-button>
            <b-button
              variant="outline-danger"
              @click="discontinueRecommendation(item)"
              class="ml-2"
              size="sm"
            >discontinue</b-button>
          </template>
        </b-table>
      </b-card-text>
    </b-card>
  </div>
</template>

<script>
export default {
  name: "recommendation-panel",
  data() {
    return {
      selected: [],
      recommendations: []
    };
  },
  computed: {
    items() {
      return this.$store.state.recommendation.list.filter(item => {
        return item.patientId == this.id && item.discontinue != true;
      });
    },
    fields() {
      if (this.selected.length > 0) {
        return ["description", "createdAt"];
      } else {
        return ["description", "createdAt", "action"];
      }
    },
    id() {
      return this.$route.query.patient_id;
    },
    style() {
      return this.$store.getters.style;
    }
  },
  mounted() {
    this.$store.dispatch("getRecommendations", {
      patientId: this.id,
      toast: this.$bvToast
    });
  },
  methods: {
    onRowSelected(items) {
      this.selected = items;
    },
    showAddModal() {
      this.$store.commit("showAddRecommendationModal");
    },
    openEditModal(object) {
      const { item } = object;
      this.$store.commit("showEditRecommendationsModal", item);
    },
    discontinueRecommendation(item) {
      this.$store.dispatch("discontinueRecommendation", {
        data: item.item,
        toast: this.$bvToast
      });
    },
    multidiscontinue() {
      let selectedIds = [];
      let selectedDatas = [];
      this.selected.forEach(item => {
        selectedIds.push(item.id);
        selectedDatas.push(item);
      });

      this.$store.dispatch("multidiscontinueRecommendation", {
        selectedIds: selectedIds,
        selectedDatas: selectedDatas,
        toast: this.$bvToast
      });
    },
    showMultiChangeModal() {
      this.$store.commit("showMultiChangeRecommendationModal");
    }
  },
  beforeDestroy() {
    clearInterval(this.timer);
  }
};
</script>

<style>
</style>
