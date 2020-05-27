<template>
  <el-dialog :visible.sync="visibility" custom-class="multi-tab-dialog" width="90%" top="5vh">
    <el-tabs v-model="tabValue" type="card" editable @edit="handleTabsEdit">
      <el-tab-pane v-for="(tab) in tabList" :key="tab.name" :label="tab.label" :name="tab.name">
        <component :is="tab.value" />
      </el-tab-pane>
    </el-tabs>
  </el-dialog>
</template>

<script>
export default {
  data() {
    return {
      tabIndex: 0
    };
  },
  computed: {
    tabList() {
      return this.$store.state.tabDialog.tabList;
    },
    tabValue: {
      get() {
        return this.$store.state.tabDialog.tabValue;
      },
      set(value) {
        this.$store.commit("setTabValue", value);
      }
    },
    visibility: {
      get() {
        return this.$store.state.tabDialog.visibility;
      },
      set(value) {
        this.$store.commit("setTabDialogVisibility", value);
      }
    }
  },
  mounted() {
    this.tabIndex = this.tabList.length;
  },
  methods: {
    handleTabsEdit(targetName, action) {
      if (action === "add") {
        const newTabName = `tab-${++this.tabIndex}`;
        const newTab = {
          label: "New tab",
          value: require("../components/element.io-tab/AddNewTab").default,
          name: newTabName
        };
        this.$store.commit("addNewTab", newTab);
      }
      if (action === "remove") {
        const newList = this.tabList.filter(tab => {
          return tab.name != targetName;
        });

        this.$store.commit("setTabList", newList);
        if (newList.length > 0) {
          this.tabValue = newList[0]["name"];
        }
      }
    }
  }
};
</script>

<style lang="scss">
.multi-tab-dialog {
  .el-dialog__header {
    display: none;
  }
  .el-dialog__body {
    padding-top: 12px;
  }
}
</style>