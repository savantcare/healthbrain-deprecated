<template>
  <div id="recommendation-panel">
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
            >A</b-button>
            <b-button
              size="sm"
              variant="primary"
              v-if="selected.length == 0"
              @click="showMultiChangeModal"
              class="ml-2"
            >M</b-button>
            <b-button variant="danger" v-if="selected.length > 0" @click="multidiscontinue">D</b-button>
          </b-row>
        </b-row>
      </template>
      <b-card-text>
        <table class="table table-bordered table-sm table-hover">
          <thead>
            <tr>
              <th v-for="(field, index) in fields" :key="`field-${index}`" scope="col">{{field}}</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(item, index) in items"
              :key="`item-${index}`"
              style="cursor: pointer;"
              :class="{'table-active': checkActiveStatus(item)}"
            >
              <td @click="onRowSelected(item)">{{item.description}}</td>
              <td @click="onRowSelected(item)">{{getFormatDate(item.createdAt)}}</td>
              <td v-if="selected.length == 0">
                <b-button
                  size="sm"
                  variant="outline-primary"
                  @click="openEditModal(item, $event)"
                  v-b-tooltip.hover.bottom="'Change'"
                >C</b-button>
                <b-button
                  variant="outline-danger"
                  @click="discontinueRecommendation(item)"
                  class="ml-2"
                  size="sm"
                  v-b-tooltip.hover.bottom="'Discontinue'"
                >D</b-button>
              </td>
            </tr>
          </tbody>
        </table>
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
      updateStatus: 0 // Value for monitor the update status of panel.
    };
  },
  computed: {
    items() {
      return this.$store.getters.panelRecommendations;
    },
    fields() {
      if (this.selected.length > 0) {
        return ["Description", "Created At"];
      } else {
        return ["Cescription", "Created At", "Action"];
      }
    },
    id() {
      return this.$route.query.patient_id;
    },
    style() {
      if (this.updateStatus > 0) {
        return "success";
      }
      return this.$store.getters.style;
    },
    itemCount() {
      return this.items.length;
    }
  },
  mounted() {
    this.$store.dispatch("getRecommendations", {
      patientId: this.id,
      toast: this.$bvToast
    });
  },
  watch: {
    itemCount() {
      this.updateStatus = 1;
      setTimeout(() => {
        this.updateStatus = 0;
      }, 2000);
    }
  },
  methods: {
    onRowSelected(item) {
      let newList = [];
      let isExistsRow = false;
      this.selected.forEach(data => {
        if (data.id == item.id) {
          isExistsRow = true;
        } else {
          newList.push(data);
        }
      });
      if (isExistsRow) {
        this.selected = newList;
      } else {
        this.selected.push(item);
      }
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
    },
    checkActiveStatus(item) {
      let isActive = false;
      this.selected.forEach(data => {
        if (data.id == item.id) {
          isActive = true;
        }
      });
      return isActive;
    },
    getFormatDate(date) {
      let custom = { year: "numeric", month: "short", day: "numeric" };
      return new Date(date).toLocaleDateString("en-us", custom);
    }
  },
  beforeDestroy() {
    clearInterval(this.timer);
  }
};
</script>

<style>
</style>
