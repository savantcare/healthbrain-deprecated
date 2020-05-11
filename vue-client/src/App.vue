<template>
  <div id="app">
    <router-view />
    <Offline @detected-condition="handleConnectivityChange"></Offline>
  </div>
</template>

<script>
const Offline = () => import("v-offline");
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
