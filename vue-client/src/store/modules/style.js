import { STYLE_API_URL } from "@/const.js"
export default {
  state: {
    value: 1
  },
  mutations: {
    setStyle(state, value) {
      state.value = value
    }
  },
  actions: {
    async loadStyle({ commit }) {
      const TOKEN = localStorage.getItem("token")
      const response = await fetch(STYLE_API_URL, {
        headers: {
          "Authorization": "Bearer " + TOKEN
        }
      });
      if (response.ok) {
        const json = await response.json();

        commit("setStyle", json.value)
      }
    }
  }
}