<template>
  <div>
    <el-button type="primary" @click="openDialog">Open Multi change social history dialog</el-button>
    <MultiChangeSocialHistoryTab />
  </div>
</template>
<script>
import MultiChangeSocialHistoryTab from "@/components/dialog/MultiChangeSocialHistoryDialog/Implementation.vue";
export default {
  components: {
    MultiChangeSocialHistoryTab
  },
  data() {
    return {};
  },
  methods: {
    openDialog() {
      this.$store.commit("setSocialHistoryVisibility", true);
    }
  }
};
</script>