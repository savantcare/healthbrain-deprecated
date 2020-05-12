<template>
  <div id="left-panel-header">
    <div id="patient-info" class="ml-2">
      <b v-if="patientInfo">{{patientInfo.name}}</b>
      <span class="ml-2" v-if="patientInfo">{{patientInfo.age + " years old"}}</span>
      <b-badge
        class="ml-2"
        :variant="activityStatus ? 'success' : 'danger'"
      >{{activityStatus ? "Online" : "Offline"}}</b-badge>
    </div>
    <div class="mr-2">
      <b-form-checkbox v-model="tabMode" name="check-button" switch>Health components</b-form-checkbox>
    </div>
  </div>
</template>

<script>
import { USER_API_URL } from "@/const.js";
export default {
  data() {
    return {
      tabMode: true,
      patientInfo: null
    };
  },
  computed: {
    activityStatus() {
      return this.$store.state.connectionStatus;
    }
  },
  watch: {
    tabMode() {
      this.updateLeftPanel();
    }
  },
  mounted() {
    this.getPatientInfo();
    this.updateLeftPanel();
  },
  methods: {
    updateLeftPanel() {
      this.$store.dispatch("getLeftPanelComponents", {
        type: this.tabMode == true ? 1 : 2,
        toast: this.$bvToast
      });
    },
    async getPatientInfo() {
      let TOKEN = localStorage.getItem("token");
      const searchQuery = {
        roleId: 3
      };
      try {
        const response = await fetch(USER_API_URL + "/getDetail", {
          method: "POST",
          headers: {
            "Content-Type": "application/json;charset=utf-8",
            Authorization: "Bearer " + TOKEN
          },
          body: JSON.stringify(searchQuery)
        });
        if (response.ok) {
          const json = await response.json();
          this.patientInfo = json[0];
        } else {
          this.$bvToast.toast("Failed to get patientInfo", {
            title: "Error",
            variant: "danger",
            solid: true
          });
        }
      } catch (ex) {
        this.$bvToast.toast("Server connection error", {
          title: "Error",
          variant: "danger",
          solid: true
        });
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