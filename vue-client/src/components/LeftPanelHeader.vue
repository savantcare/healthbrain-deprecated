<template>
  <div id="left-panel-header">
    <div id="patient-info" class="ml-2">
      <b>Patient 1</b>
      <span class="ml-2">30 years old</span>
      <b-badge
        class="ml-2"
        :variant="activityStatus ? 'success' : 'danger'"
      >{{activityStatus ? "Online" : "Offline"}}</b-badge>
    </div>
    <div class="mr-2">
      <b-form-checkbox
        v-model="tabMode"
        @change="updateLeftPanel"
        name="check-button"
        switch
      >Switch Tab</b-form-checkbox>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tabMode: false
    };
  },
  computed: {
    activityStatus() {
      return this.$store.state.connectionStatus;
    }
  },
  methods: {
    updateLeftPanel() {
      const list1 = [
        require("./RecommendationPanel").default,
        require("./ReminderPanel").default
      ];
      const list2 = [require("./ReminderPanel").default];
      if (this.tabMode) {
        this.$store.commit("setLeftPanelList", list1);
      } else {
        this.$store.commit("setLeftPanelList", list2);
      }
    }
  }
};
</script>

<style scoped>
#left-panel-header {
  background-color: #563d7c;
  height: 50px;
  width: 100%;
  display: flex;
  color: white;
  align-items: center;
  justify-content: space-between;
}
</style>