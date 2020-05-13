import { SETTING_API_URL } from "@/const.js"
export default {
  state: {
    style: 1
  },
  mutations: {
    setStyle(state, value) {
      state.style = value
    }
  },
  actions: {
    async loadSetting({ commit }) {
      const TOKEN = localStorage.getItem("token")
      const response = await fetch(SETTING_API_URL, {
        headers: {
          "Authorization": "Bearer " + TOKEN
        }
      });
      if (response.ok) {
        const settings = await response.json();
        // load style
        const styleIndex = settings.findIndex(item => {
          return item.key == "style"
        })
        const style = settings[styleIndex].value
        commit("setStyle", style)
      }
    }
  },
  getters: {
    style(state) {
      if (state.style == 1) {
        return "info"
      }
      return "dark"
    }
  }
}