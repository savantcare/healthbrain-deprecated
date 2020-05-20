<template>
  <b-modal v-model="visibility" centered hide-header hide-footer size="lg" @hidden="onCloseDialog">
    <b-card no-body>
      <b-tabs v-model="tabIndex" card>
        <component v-for="(tab, index) in tabList" :key="`tab-${index}`" :is="tab.value"></component>

        <b-tab title="New Tab" v-if="showNewTab">
          <b-form-input ref="search_input" v-model="keyword" @keydown="searchBoxKeyDownHandler"></b-form-input>
          <b-list-group class="ml-2 mr-2">
            <b-list-group-item
              v-for="(item, index) in searchTabList"
              :key="`search-item-${index}`"
              :active="index == 0"
            >{{item.value}}</b-list-group-item>
          </b-list-group>
        </b-tab>

        <!-- New Tab Button (Using tabs-end slot) -->
        <template v-slot:tabs-end>
          <b-nav-item role="presentation" @click.prevent="newTab" href="#">
            <b>+</b>
          </b-nav-item>
        </template>

        <!-- Render this if no tabs -->
        <template v-slot:empty>
          <div class="text-center text-muted">
            There are no open tabs
            <br />Open a new tab using the
            <b>+</b> button above.
          </div>
        </template>
      </b-tabs>
    </b-card>
  </b-modal>
</template>

<script>
import {
  ADD_RECOMMENDATION,
  MULTIPLE_CHANGE_RECOMMENDATION,
  ADD_REMINDER,
  MULTIPLE_CHANGE_REMINDER
} from "@/const.js";
export default {
  components: {},
  data() {
    return {
      showNewTab: false,
      TABS: [
        { key: ADD_RECOMMENDATION, value: "Add recommendation" },
        {
          key: MULTIPLE_CHANGE_RECOMMENDATION,
          value: "Multi change recommendation"
        },
        { key: ADD_REMINDER, value: "Add reminder" },
        { key: MULTIPLE_CHANGE_REMINDER, value: "Multi change reminder" }
      ],
      keyword: "",
      tabIndex: 0
    };
  },
  computed: {
    visibility: {
      get() {
        return this.$store.state.tabDialog.visibility;
      },
      set(value) {
        this.$store.commit("setTabDialogVisibility", value);
      }
    },
    tabList() {
      return this.$store.state.tabDialog.tabList;
    },
    searchTabList() {
      if (this.keyword.length < 1) {
        return [];
      }
      return this.TABS.filter(item => {
        let isExist = false;
        this.tabList.forEach(tab => {
          if (tab.key == item.key) {
            isExist = true;
          }
        });
        if (isExist) {
          return false;
        }
        return item.value.search(this.keyword) > -1;
      });
    }
  },
  methods: {
    newTab() {
      this.showNewTab = true;
      setTimeout(() => {
        this.tabIndex += 1;
        setTimeout(() => {
          this.$refs.search_input.focus();
        }, 100);
      }, 100);
    },
    onCloseDialog() {
      this.showNewTab = false;
      this.$store.commit("setTabList", []);
    },
    searchBoxKeyDownHandler(e) {
      if (e.keyCode == 13) {
        const tabItem = this.searchTabList[0];
        let newTab = null;
        switch (tabItem.key) {
          case MULTIPLE_CHANGE_RECOMMENDATION:
            newTab = {
              key: MULTIPLE_CHANGE_RECOMMENDATION,
              value: require("../tab/MultiChangeRecommendationTab").default
            };
            break;
          case ADD_RECOMMENDATION:
            newTab = {
              key: ADD_RECOMMENDATION,
              value: require("../tab/AddRecommendationTab").default
            };
            this.$store.commit("setRecommendationTabType", ADD_RECOMMENDATION);
            break;
          case ADD_REMINDER:
            newTab = {
              key: ADD_REMINDER,
              value: require("../tab/AddReminderTab").default
            };
            this.$store.commit("setReminderTabType", ADD_REMINDER);
            break;
          case MULTIPLE_CHANGE_REMINDER:
            newTab = {
              key: MULTIPLE_CHANGE_REMINDER,
              value: require("../tab/MultiChangeReminderTab").default
            };
            break;
        }

        this.$store.commit("addNewTab", newTab);
        this.showNewTab = false;
      }
    }
  },
  mounted() {}
};
</script>

<style lang="scss" scoped>
</style>