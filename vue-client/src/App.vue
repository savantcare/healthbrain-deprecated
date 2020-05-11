<template>
  <div id="app">
    <router-view />
    <Offline @detected-condition="handleConnectivityChange"></Offline>
  </div>
</template>

<script>
import Offline from "v-offline";
export default {
  components: {
    Offline
  },
  methods: {
    handleConnectivityChange(status) {
      this.$store.commit("setConnectionStatus", status);
    }
  }
};
</script>

<style lang="scss">
</style>
