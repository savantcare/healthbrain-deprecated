import { COMPONENT_API_URL, LEFT_SIDE_COMPONENTS } from '@/const.js'
export default {
  state: {
    list: []
  },
  mutations: {
    setLeftPanelList(state, value) {
      state.list = value
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
          console.log(components)
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
        }
      } catch (ex) {
        toast.toast("Server connection error", {
          title: "Error",
          variant: "danger",
          solid: true
        })
      }
    }
  }
}