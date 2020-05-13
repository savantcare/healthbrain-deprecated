import { ADD_RECOMMENDATION, MULTIPLE_CHANGE_RECOMMENDATION, EDIT_RECOMMENDATION, ADD_REMINDER, EDIT_REMINDER, MULTIPLE_CHANGE_REMINDER } from "@/const.js"
export default {
  state: {
    visibility: false,
    tabList: [],
    recommendationTabType: '',
    recommendationData: null,
    reminderTabType: '',
    reminderData: null
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
      state.tabList.push(newTab)
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
      const addRecommendationTab = require("@/components/tab_components/AddRecommendationTab.vue");
      state.tabList = [
        { key: ADD_RECOMMENDATION, value: addRecommendationTab.default }
      ]
      state.recommendationTabType = ADD_RECOMMENDATION
      state.visibility = true
    },
    showMultiChangeRecommendationModal(state) {
      const tab = require("@/components/tab_components/MultiChangeRecommendationTab.vue");
      state.tabList = [
        { key: MULTIPLE_CHANGE_RECOMMENDATION, value: tab.default }
      ]
      state.recommendationTabType = MULTIPLE_CHANGE_RECOMMENDATION
      state.visibility = true
    },
    showEditRecommendationsModal(state, data) {
      const addRecommendationTab = require("@/components/tab_components/AddRecommendationTab.vue");
      state.tabList = [
        { key: ADD_RECOMMENDATION, value: addRecommendationTab.default }
      ]
      state.visibility = true
      state.recommendationTabType = EDIT_RECOMMENDATION
      state.recommendationData = data
    },
    showAddReminderModal(state) {
      const addReminderTab = require("@/components/tab_components/AddReminderTab.vue");
      state.tabList = [
        { key: ADD_REMINDER, value: addReminderTab.default }
      ]
      state.reminderTabType = ADD_REMINDER
      state.visibility = true
    },
    showMultiChangeReminderModal(state) {
      const tab = require("@/components/tab_components/MultiChangeReminderTab.vue");
      state.tabList = [
        { key: MULTIPLE_CHANGE_REMINDER, value: tab.default }
      ]
      state.reminderTabType = MULTIPLE_CHANGE_REMINDER
      state.visibility = true
    },
    showEditReminderModal(state, data) {
      const addReminderTab = require("@/components/tab_components/AddReminderTab.vue");
      state.tabList = [
        { key: ADD_REMINDER, value: addReminderTab.default }
      ]
      state.visibility = true
      state.reminderTabType = EDIT_REMINDER
      state.reminderData = data
    }
  }
}