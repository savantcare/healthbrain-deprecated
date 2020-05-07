import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from "vuex-persistedstate";
Vue.use(Vuex)

// modules
import recommendationModule from './modules/recommendation'
import reminderModule from './modules/reminder'
import settingModule from './modules/setting'
import rightPanelModule from './modules/rightPanel'

export default new Vuex.Store({
  state: {
    userRole: '',
    SEARCH_COMPONENT_LIST: ["clear", "recommendations (rex)", "reminders (rem)"],
    focusComponent: ""
  },
  mutations: {
    setUserRole(state, data) {
      state.userRole = data
    },
    setFocusComponent(state, value) {
      state.focusComponent = value
    }
  },
  actions: {
  },
  modules: {
    recommendation: recommendationModule,
    reminder: reminderModule,
    setting: settingModule,
    rightPanel: rightPanelModule
  },
  plugins: [
    createPersistedState()
  ]
})
