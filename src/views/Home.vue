<template>
  <b-container fluid>
    <b-row>
      <b-col cols="8">
        <recommendation-panel></recommendation-panel>
      </b-col>
      <b-col cols="4">
        <recommendation-card></recommendation-card>
      </b-col>
    </b-row>
    <b-row class="mt-2">
      <b-col cols="8">
        <reminder-card></reminder-card>
      </b-col>
      <b-col cols="4">
        <reminder-panel></reminder-panel>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import RecommendationCard from "@/components/RecommendationCard.vue";
import RecommendationPanel from "@/components/RecommendationPanel.vue";
import ReminderCard from "@/components/ReminderCard.vue";
import ReminderPanel from "@/components/ReminderPanel.vue";

export default {
  name: "Home",
  components: {
    RecommendationCard,
    RecommendationPanel,
    ReminderCard,
    ReminderPanel
  },
  mounted() {
    this.$store.dispatch("loadStyle");
  }
};
</script>
