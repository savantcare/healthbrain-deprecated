import { COMPONENT_API_URL, LEFT_SIDE_COMPONENTS } from '@/const.js'
import $ from "jquery";

export default {
  state: {
    list: [],
    currentDate: "",
    zoomValue: 1,
    originSize: null
  },
  mutations: {
    setLeftPanelList(state, value) {
      state.list = value
    },
    setLeftPanelCurrentDate(state, value) {
      state.currentDate = value
    },
    setLeftPanelZoomValue(state, value) {
      state.zoomValue = value
    }
  },
  actions: {
    async getLeftPanelComponents({ commit }, json) {
      const { toast, type } = json
      const TOKEN = localStorage.getItem("token")
      try {
        const response = await fetch(COMPONENT_API_URL + "/getByType/" + type, {
          method: "GET",
          headers: {
            "Content-Type": "application/json;charset=utf-8",
            "Authorization": "Bearer " + TOKEN
          },
        })
        if (response.ok) {
          const components = await response.json()
          let availableComponents = []
          components.forEach(item => {
            const component = LEFT_SIDE_COMPONENTS.filter(leftComponent => {
              return leftComponent.key == item.name
            })
            if (component != null) {
              availableComponents.push(component[0].value)
            }
          })
          commit("setLeftPanelList", availableComponents)
          // dispatch("zoomLeftPanel")
        }
      } catch (ex) {
        toast.toast("Server connection error", {
          title: "Error",
          variant: "danger",
          solid: true
        })
      }
    },
    zoomLeftPanel({ state }) {
      const r = state.zoomValue
      $("#leftPanelContent").css({
        "-webkit-transform": "scale(" + r + ")",
        "-moz-transform": "scale(" + r + ")",
        "-ms-transform": "scale(" + r + ")",
        "-o-transform": "scale(" + r + ")",
        transform: "scale(" + r + ")"
      });

      var height = document.getElementById("leftPanelContent").offsetHeight;
      var windowHeight = $(document).outerHeight() - 100;
      height = Math.ceil(height * r)

      if (height > windowHeight) {
        $("#leftPanelContent").css({
          position: "initial"
        })
      } else {
        $("#leftPanelContent").css({
          position: "fixed"
        })
      }
    }
  }
}