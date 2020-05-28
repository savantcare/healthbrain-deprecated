import { SOCIALHISTORY_API_URL } from "@/const.js"
export default {
  state: {
    history: {
      birthPlace: '',
      livesWith: '',
      livesIn: '',
      numberOfChildren: '',
      biologicalGender: '',
      userDateOfBirth: '',
      maritalHistory: [],
      otherMajorEvent: [],
      educationHistory: [],
      employmentHistory: []
    }
  },
  mutations: {
    setSocialHistoryData(state, value) {
      state.history = value
    }
  },
  actions: {
    async saveSocialHistory({ state }, object) {
      const { notify, changeStatus } = object
      const TOKEN = localStorage.getItem("token")
      let sendData = {}
      Object.keys(changeStatus).forEach(key => {
        if (changeStatus[key] == false) {
          sendData[key] = state.history[key]
        }
      })
      console.log(sendData)
      const response = await fetch(SOCIALHISTORY_API_URL, {
        headers: {
          "Content-Type": "application/json;charset=utf-8",
          "Authorization": "Bearer " + TOKEN
        },
        method: 'POST',
        body: JSON.stringify(sendData)
      });
      if (response.ok) {
        console.log('saved!')
        notify({
          title: 'Title',
          message: 'Saved!'
        });
      }
    },
    async getSocialHistory({ commit }) {
      const response = await fetch(SOCIALHISTORY_API_URL, {
        method: "GET"
      })
      if (response.ok) {
        const json = await response.json()
        commit("setSocialHistoryData", json)
      }
    }
  }
}