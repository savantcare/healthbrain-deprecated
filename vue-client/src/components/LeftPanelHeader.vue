<template>
  <div>
    <div id="left-panel-header">
      <div id="patient-info" class="ml-2">
        <b v-if="patientInfo">{{patientInfo.name}}</b>
        <span class="ml-2" v-if="patientInfo">{{patientInfo.age + " years old"}}</span>
        <b-badge
          class="ml-2"
          :variant="activityStatus ? 'success' : 'danger'"
        >{{activityStatus ? "Online" : "Offline"}}</b-badge>
        <span>{{currentDate}}</span>
      </div>
      <div class="mr-2" style="display: flex; align-items: center;">
        <div class="mr-2">
          <b-icon-dash-circle
            style="cursor: pointer;"
            v-b-tooltip.hover.bottom="'Zoom out'"
            @click="zoomOut"
          ></b-icon-dash-circle>
          <b-icon-plus-circle
            class="ml-2"
            style="cursor: pointer;"
            v-b-tooltip.hover.bottom="'Zoom in'"
            @click="zoomIn"
          ></b-icon-plus-circle>
        </div>
        <b-form-checkbox v-model="tabMode" name="check-button" switch>Health components</b-form-checkbox>
      </div>
    </div>
  </div>
</template>

<script>
import { USER_API_URL } from "@/const.js";
import $ from "jquery";
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
    },
    currentDate() {
      return this.$store.state.leftPanel.currentDate;
    },
    zoomValue() {
      return this.$store.state.leftPanel.zoomValue;
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
    // this.zoomValue = this.$store.state.leftPanel.zoomValue;
    // this.zoomLeftPanel();
  },
  methods: {
    async updateLeftPanel() {
      await this.$store.dispatch("getLeftPanelComponents", {
        type: this.tabMode == true ? 1 : 2,
        toast: this.$bvToast
      });

      setTimeout(() => {
        var width = document.getElementById("leftPanelContent").offsetWidth;
        var height = document.getElementById("leftPanelContent").offsetHeight;
        var windowWidth = $(document).outerWidth();
        var windowHeight = $(document).outerHeight();
        windowWidth = windowWidth * (70 / 100);
        windowHeight = windowHeight - 100;

        const r = Math.min(windowWidth / width, windowHeight / height);
        this.$store.commit("setLeftPanelZoomValue", r);
        this.$store.dispatch("zoomLeftPanel");
      }, 100);
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
    },
    zoomOut() {
      let value = this.zoomValue;
      value -= 0.1;
      this.$store.commit("setLeftPanelZoomValue", value);
      this.$store.dispatch("zoomLeftPanel");
    },
    zoomIn() {
      let value = this.zoomValue;
      value += 0.1;
      this.$store.commit("setLeftPanelZoomValue", value);
      this.$store.dispatch("zoomLeftPanel");
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