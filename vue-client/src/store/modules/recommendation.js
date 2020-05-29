import { RECOMMENDATION_API_URL } from "@/const.js"
let TOKEN = localStorage.getItem("token")
export default {
  state: {                       // Cannot be changed directly. Can only be changed through mutation
    list: [],
    currentDate: new Date()
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
    },
    setRecommendationCurrentDate(state, value) {
      state.currentDate = value
    },

    /**
     * Socket Listeners
     */
    SOCKET_ON_UPDATE_RECOMMENDATIONS(state, updateList) {   // Message received from socket server
      state.list = updateList
    },
    SOCKET_ADD_RECOMMENDATION(state, newData) {         // Msg recd from node-server/routes/recommendation.route.js
      if (state.list.length > 0) {                      // At the client where this data was added it needs to be skipped
        const lastData = state.list[state.list.length - 1]
        if (lastData.recommendationID == newData.recommendationID) {
          return
        }
      }
      state.list.push(newData)
    },
    SOCKET_UPDATE_RECOMMENDATION(state, updateData) {
      let newList = []
      state.list.forEach(item => {
        if (item.id != updateData.id) {
          newList.push(item)
        } else {
          newList.push(updateData)
        }
      })
      state.list = newList
    },
    SOCKET_DISCONTINUE_RECOMMENDATION(state, dispatchId) {
      console.log("SOCKET_DISCONTINUE_RECOMMENDATION")
      const newList = state.list.filter(item => {
        return item.id != dispatchId
      })
      state.list = newList
    }
  },
  actions: {
    async addRecommendation(_, json) {
      const { data, notify } = json

      // commit("addNewRecommendation", data)

      try {
        const response = await fetch(RECOMMENDATION_API_URL, {
          method: "POST",
          headers: {
            "Content-Type": "application/json;charset=utf-8",
            "Authorization": "Bearer " + TOKEN
          },
          body: JSON.stringify(data)
        })
        if (!response.ok) {
          notify({
            title: "Error",
            message: "Failed to add recommendation data"
          })
          // commit("removeNewRecommendation")
        } else {
          notify({
            title: "Success",
            message: "Saved!"
          })
        }
      } catch (ex) {
        notify({
          title: "Error",
          message: "Server connection error"
        })
        // commit("removeNewRecommendation")
      }
    },
    async updateRecommendation({ state, commit }, json) {
      const { data, notify } = json
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
            "Content-Type": "application/json;charset=utf-8",
            "Authorization": "Bearer " + TOKEN
          },
          body: JSON.stringify(data)
        });
        if (!response.ok) {
          notify({
            title: "Error",
            message: "Failed to update recommendation data"
          })

          commit("setRecommendationList", originList)
        }
      } catch (ex) {
        notify({
          title: "Error",
          message: "Server connection error"
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
        data["discontinue"] = true
        const response = await fetch(`${RECOMMENDATION_API_URL}/${data.id}`, {
          method: "PATCH",
          headers: {
            "Content-Type": "application/json;charset=utf-8",
            "Authorization": "Bearer " + TOKEN
          },
          body: JSON.stringify(data)
        });
        if (!response.ok) {
          toast.toast("Failed to discontinue recommendation data", {
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
      const { selectedIds, toast, selectedDatas } = json
      const originList = state.list
      const newList = originList.filter(item => {
        return !selectedIds.includes(item.id)
      })

      commit("setRecommendationList", newList)


      selectedDatas.forEach(async item => {
        try {
          item['discontinue'] = true
          await fetch(`${RECOMMENDATION_API_URL}/${item.id}`, {
            method: "PATCH",
            headers: {
              "Content-Type": "application/json;charset=utf-8",
              "Authorization": "Bearer " + TOKEN
            },
            body: JSON.stringify(item)
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
      const { patientId, notify } = json
      if (TOKEN == null) {
        TOKEN = localStorage.getItem("token")
      }
      try {
        const response = await fetch(
          `${RECOMMENDATION_API_URL}?patientId=${patientId}`, {
          headers: {
            "Authorization": "Bearer " + TOKEN
          }
        });
        if (response.ok) {
          let json = await response.json();
          commit('setRecommendationList', json)
        } else {
          if (response.status == '401') {
            notify({
              title: "Error",
              message: "Token is expired."
            })
            localStorage.removeItem("token")
            window.location = "/"
          } else {
            notify({
              title: "Error",
              message: "Failed to get recommendation data"
            })
          }
        }
      } catch (ex) {
        notify({
          title: "Error",
          message: "Server connection error"
        })

      }
    }
  },
  getters: {
    recommendations(state) {
      return state.list.filter(item => {
        return item.discontinue != true
      })
    },
    panelRecommendations(state) {
      return state.list.filter(item => {
        const itemDate = new Date(item.createdAt)
        return item.discontinue != true && itemDate <= state.currentDate
      })
    }
  }
}