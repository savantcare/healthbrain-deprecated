import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from "vuex-persistedstate";
Vue.use(Vuex)

// modules
import recommendationModule from './modules/recommendation'
import reminderModule from './modules/reminder'
import settingModule from './modules/setting'
import rightPanelModule from './modules/rightPanel'

import { ROLE_API_URL } from "@/const.js"

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
    },
    setSearchComponentList(state, list) {
      state.SEARCH_COMPONENT_LIST = list
    }
  },
  actions: {
    async getRoleDetails({ commit }, roleId) {
      const token = localStorage.getItem("token")
      const response = await fetch(`${ROLE_API_URL}/${roleId}`, {
        headers: {
          "Authorization": "Bearer " + token
        }
      })
      if (response.ok) {
        const json = await response.json()
        let componentList = json.availableComponents.split(',')
        componentList.push("clear")
        commit("setSearchComponentList", componentList)
      }
    }
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
