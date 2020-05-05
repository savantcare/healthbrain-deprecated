import { RECOMMENDATION_API_URL } from "@/const.js"

export default {
  state: {
    list: []
  },
  mutations: {
    setRecommendationList(state, data) {
      state.list = data
    },
    addNewRecommendation(state, data) {
      state.list.push(data)
    },
    removeNewRecommendation(state) {
      state.list.pop()
    }
  },
  actions: {
    async saveRecommendation({ commit }, json) {
      const { data, toast } = json

      commit("addNewRecommendation", data)

      try {
        const response = await fetch(RECOMMENDATION_API_URL, {
          method: "POST",
          headers: {
            "Content-Type": "application/json;charset=utf-8"
          },
          body: JSON.stringify(data)
        })
        if (!response.ok) {
          toast.toast("Failed to add data", {
            title: "Error",
            variant: "danger",
            solid: true
          })
          commit("removeNewRecommendation")
        }
      } catch (ex) {
        toast.toast("Server connection error", {
          title: "Error",
          variant: "danger",
          solid: true
        })
        commit("removeNewRecommendation")
      }
    },
    async updateRecommendation({ state, commit }, json) {
      const { data, toast } = json
      const originList = state.list
      let newList = []
      originList.forEach(item => {
        if (item.id == data.id) {
          newList.push({
            id: data.id,
            description: data.description,
            createdAt: data.createdAt,
            patientId: data.patientId
          });
        } else {
          newList.push(item);
        }
      });

      commit("setRecommendationList", newList)
      try {
        const response = await fetch(`${RECOMMENDATION_API_URL}/${data.id}`, {
          method: "PUT",
          headers: {
            "Content-Type": "application/json;charset=utf-8"
          },
          body: JSON.stringify(data)
        });
        if (!response.ok) {
          toast.toast("Failed to update data", {
            title: "Error",
            variant: "danger",
            solid: true
          })

          commit("setRecommendationList", originList)
        }
      } catch (ex) {
        toast.toast("Server connection error", {
          title: "Error",
          variant: "danger",
          solid: true
        })

        commit("setRecommendationList", originList)
      }
    },
    async discontinueRecommendation({ state, commit }, json) {
      const { data, toast } = json
      const originList = state.list
      const newList = originList.filter(item => {
        return item.id != data.id
      })

      commit("setRecommendationList", newList)
      try {
        const response = await fetch(`${RECOMMENDATION_API_URL}/${data.id}`, { method: "DELETE" });
        if (!response.ok) {
          toast.toast("Failed to discontinue data", {
            title: "Error",
            variant: "danger",
            solid: true
          })

          commit("setRecommendationList", originList)
        }
      } catch (ex) {
        toast.toast("Server connection error", {
          title: "Error",
          variant: "danger",
          solid: true
        })

        commit("setRecommendationList", originList)
      }
    },
    async multidiscontinueRecommendation({ state, commit }, json) {
      const { data, toast } = json
      const originList = state.list
      const newList = originList.filter(item => {
        return !data.includes(item.id)
      })

      commit("setRecommendationList", newList)


      data.forEach(async item => {
        try {
          await fetch(`${RECOMMENDATION_API_URL}/${item}`, {
            method: "DELETE"
          });
        } catch (ex) {
          toast.toast("Server connection error", {
            title: "Error",
            variant: "danger",
            solid: true
          })
          commit('setRecommendationList', originList)
        }
      })
    },
    async getRecommendations({ commit }, json) {
      const { patientId, toast } = json
      try {
        const response = await fetch(
          `${RECOMMENDATION_API_URL}?patientId=${patientId}`
        );
        if (response.ok) {
          let json = await response.json();
          console.log(json)
          commit('setRecommendationList', json)
        } else {
          toast.toast("Failed to get data", {
            title: "Error",
            variant: "danger",
            solid: true
          })
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