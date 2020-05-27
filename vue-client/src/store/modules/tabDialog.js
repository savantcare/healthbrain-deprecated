import { ADD_RECOMMENDATION, MULTIPLE_CHANGE_RECOMMENDATION, EDIT_RECOMMENDATION, ADD_REMINDER, EDIT_REMINDER, MULTIPLE_CHANGE_REMINDER } from "@/const.js"
export default {
  state: {
    visibility: false,
    tabList: [],
    recommendationTabType: '',
    recommendationData: null,
    reminderTabType: '',
    reminderData: null,
    tabValue: ""
  },
  mutations: {
    setTabDialogVisibility(state, value) {
      state.visibility = value
    },
    setRecommendationTabType(state, value) {
      state.recommendationTabType = value
    },
    setRecommendationData(state, value) {
      state.recommendationData = value
    },
    addNewTab(state, newTab) {
      const { name } = newTab
      const checkArray = state.tabList.filter(tab => {
        return tab.name == name
      })
      if (checkArray.length == 0) {
        state.tabList.push(newTab)
      }
      state.tabValue = name
    },
    setTabValue(state, value) {
      state.tabValue = value
    },
    setTabList(state, value) {
      state.tabList = value
    },
    setReminderTabType(state, value) {
      state.reminderTabType = value
    },
    setReminderData(state, value) {
      state.reminderData = value
    },
    showAddRecommendationModal(state) {
      const tab = {
        label: "Add Recommendation",
        value: require("@/components/element.io-tab/AddRecommendation.vue").default,
        name: "tab-add-recommendation"
      }
      state.tabList = [tab]
      state.recommendationTabType = ADD_RECOMMENDATION
      state.visibility = true
      state.tabValue = tab.name
    },
    showMultiChangeRecommendationModal(state) {
      const tab = require("@/components/tab/MultiChangeRecommendationTab.vue");
      state.tabList = [
        { key: MULTIPLE_CHANGE_RECOMMENDATION, value: tab.default }
      ]
      state.recommendationTabType = MULTIPLE_CHANGE_RECOMMENDATION
      state.visibility = true
    },
    showEditRecommendationsModal(state, data) {
      const addRecommendationTab = require("@/components/tab/AddRecommendationTab.vue");
      state.tabList = [
        { key: ADD_RECOMMENDATION, value: addRecommendationTab.default }
      ]
      state.visibility = true
      state.recommendationTabType = EDIT_RECOMMENDATION
      state.recommendationData = data
    },
    showAddReminderModal(state) {
      const addReminderTab = require("@/components/tab/AddReminderTab.vue");
      state.tabList = [
        { key: ADD_REMINDER, value: addReminderTab.default }
      ]
      state.reminderTabType = ADD_REMINDER
      state.visibility = true
    },
    showMultiChangeReminderModal(state) {
      const tab = require("@/components/tab/MultiChangeReminderTab.vue");
      state.tabList = [
        { key: MULTIPLE_CHANGE_REMINDER, value: tab.default }
      ]
      state.reminderTabType = MULTIPLE_CHANGE_REMINDER
      state.visibility = true
    },
    showEditReminderModal(state, data) {
      const addReminderTab = require("@/components/tab/AddReminderTab.vue");
      state.tabList = [
        { key: ADD_REMINDER, value: addReminderTab.default }
      ]
      state.visibility = true
      state.reminderTabType = EDIT_REMINDER
      state.reminderData = data
    }
  }
}