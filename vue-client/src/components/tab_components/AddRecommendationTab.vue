<template>
  <b-tab>
    <template v-slot:title>
      {{modalTitle}}
      <b-button size="sm" variant="danger" @click="closeTab">x</b-button>
    </template>
    <label>Description:</label>

    <b-form-textarea
      id="textarea-state"
      v-model="description"
      :state="validation"
      rows="5"
      autofocus
    ></b-form-textarea>
    <b-form-invalid-feedback :state="validation">Description content is required.</b-form-invalid-feedback>

    <b-button
      class="float-right mb-2 mt-2"
      variant="primary"
      size="sm"
      @click="save"
      :disabled="!validation"
    >{{buttonText}}</b-button>
  </b-tab>
</template>

<script>
import { ADD_RECOMMENDATION, EDIT_RECOMMENDATION } from "@/const.js";
import uniqid from "uniqid";

export default {
  data() {
    return {
      description: ""
    };
  },
  computed: {
    type() {
      return this.$store.state.tabDialog.recommendationTabType;
    },
    modalTitle() {
      if (this.type == ADD_RECOMMENDATION) {
        return "Add Recommendation";
      }
      return "Edit Recommendation";
    },
    buttonText() {
      if (this.type == ADD_RECOMMENDATION) {
        return "Save";
      }
      return "Update";
    },
    validation() {
      return this.description.length > 0;
    },
    id() {
      return this.$route.query.patient_id;
    },
    updateData() {
      return this.$store.state.tabDialog.recommendationData;
    },
    tabList() {
      return this.$store.state.tabDialog.tabList;
    },
    userId() {
      return this.$store.state.userId;
    }
  },
  methods: {
    save() {
      if (this.type == ADD_RECOMMENDATION) {
        const today = new Date();
        const data = {
          createdAt: today.toDateString(),
          recommendationID: uniqid(),
          patientId: this.id,
          description: this.description,
          createdByUserId: this.userId
        };

        this.$store.dispatch("addRecommendation", {
          data: data,
          toast: this.$bvToast
        });
      } else {
        this.updateData["description"] = this.description;
        this.updateData["discontinuedByUserId"] = this.userId;
        this.updateData["createdByUserId"] = this.userId;

        this.$store.dispatch("updateRecommendation", {
          data: this.updateData,
          toast: this.$bvToast
        });
      }
      this.description = "";
    },
    closeTab() {
      const newList = this.tabList.filter(item => {
        return item.key != ADD_RECOMMENDATION;
      });
      this.$store.commit("setTabList", newList);
    }
  },
  mounted() {
    if (this.type == EDIT_RECOMMENDATION) {
      this.description = this.updateData.description;
    }
  }
};
</script>

<style lang="scss" scoped>
</style>