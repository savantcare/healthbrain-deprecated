import { ADD_RECOMMENDATION, MULTIPLE_CHANGE_RECOMMENDATION, EDIT_RECOMMENDATION, ADD_DIAGNOSIS, MULTIPLE_CHANGE_ASSESSMENT, ADD_SERVICE_STATEMENTS, MULTIPLE_CHANGE_SERVICE_STATEMENTS } from "@/const.js"
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
        value: require("@/components/element.io-tab/recommendation/AddRecommendation.vue").default,
        name: "tab-add-recommendation"
      }
      state.tabList = [tab]
      state.recommendationTabType = ADD_RECOMMENDATION
      state.visibility = true
      state.tabValue = tab.name
    },
    showMultiChangeRecommendationModal(state) {
      const tab = {
        label: "Multi change Recommendation",
        value: require("@/components/element.io-tab/recommendation/MultiChangeRecommendation.vue").default,
        name: "tab-multi-change-recommendation"
      }
      state.tabList = [tab]
      state.recommendationTabType = MULTIPLE_CHANGE_RECOMMENDATION
      state.visibility = true
      state.tabValue = tab.name
    },
    showEditRecommendationsModal(state, data) {
      const tab = {
        label: "Edit Recommendation",
        value: require("@/components/element.io-tab/recommendation/AddRecommendation.vue").default,
        name: "tab-edit-recommendation"
      }
      state.tabList = [tab]
      state.visibility = true
      state.recommendationTabType = EDIT_RECOMMENDATION
      state.recommendationData = data
      state.tabValue = tab.name
    },
    showAddDiagnosisModal(state) {
      const tab = {
        label: "Add Diagnosis",
        value: require("@/components/element.io-tab/diagnosis/AddDiagnosis.vue").default,
        name: "tab-add-diagnosis"
      }
      state.tabList = [tab]
      state.diagnosisTabType = ADD_DIAGNOSIS
      state.visibility = true
      state.tabValue = tab.name
    },
    showMultiChangeAssessmentModal(state) {
      const tab = {
        label: "Multi change assessment diagnosis",
        value: require("@/components/element.io-tab/diagnosis/MultiChangeAssessment.vue").default,
        name: "tab-multi-change-assessment"
      }
      state.tabList = [tab]
      state.diagnosisTabType = MULTIPLE_CHANGE_ASSESSMENT
      state.visibility = true
      state.tabValue = tab.name
    },
    showAddServiceStatementsModal(state) {
      const tab = {
        label: "Add service statements",
        value: require("@/components/element.io-tab/service-statements/AddServiceStatements.vue").default,
        name: "tab-service-statements"
      }
      state.tabList = [tab]
      state.serviceStatementsTabType = ADD_SERVICE_STATEMENTS
      state.visibility = true
      state.tabValue = tab.name
    },
    showMultiChangeServiceStatementsModal(state) {
      const tab = {
        label: "Multi change service statements",
        value: require("@/components/element.io-tab/service-statements/MultiChangeServiceStatements.vue").default,
        name: "tab-multi-change-service-statements"
      }
      state.tabList = [tab]
      state.serviceStatementsTabType = MULTIPLE_CHANGE_SERVICE_STATEMENTS
      state.visibility = true
      state.tabValue = tab.name
    }
  }
}