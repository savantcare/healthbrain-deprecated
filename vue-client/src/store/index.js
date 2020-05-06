import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from "vuex-persistedstate";
Vue.use(Vuex)

// modules
import recommendationModule from './modules/recommendation'
import reminderModule from './modules/reminder'
import settingModule from './modules/setting'

export default new Vuex.Store({
  state: {
    userRole: ''
  },
  mutations: {
    setUserRole(state, data) {
      state.userRole = data
    }
  },
  actions: {
  },
  modules: {
    recommendation: recommendationModule,
    reminder: reminderModule,
    setting: settingModule
  },
  plugins: [
    createPersistedState()
  ]
})
