import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from "vuex-persistedstate";
Vue.use(Vuex)

// modules
import recommendationModule from './modules/recommendation'
import reminderModule from './modules/reminder'
import styleModule from './modules/style'

export default new Vuex.Store({
  state: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    recommendation: recommendationModule,
    reminder: reminderModule,
    style: styleModule
  },
  plugins: [
    createPersistedState()
  ]
})
