import { DIAGNOSIS_API_URL } from "@/const.js"
let TOKEN = localStorage.getItem("token")
export default {
  state: {                       // Cannot be changed directly. Can only be changed through mutation
    list: [],
    currentDate: new Date()
  },
  mutations: {
    setDiagnosisList(state, data) {
      state.list = data
    },
    addNewDiagnosis(state, data) {
      state.list.push(data)
    },
    removeNewDiagnosis(state) {
      state.list.pop()
    },
    setDiagnosisCurrentDate(state, value) {
      state.currentDate = value
    },

    /**
     * Socket Listeners
     */
    SOCKET_ON_UPDATE_DIAGNOSES(state, updateList) {   // Message received from socket server
      state.list = updateList
    },
    SOCKET_ADD_DIAGNOSIS(state, newData) {         // Msg recd from node-server/routes/diagnosis.route.js
      if (state.list.length > 0) {                      // At the client where this data was added it needs to be skipped
        const lastData = state.list[state.list.length - 1]
        if (lastData.diagnosisID == newData.diagnosisID) {
          return
        }
      }
      state.list.push(newData)
    },
    SOCKET_UPDATE_DIAGNOSIS(state, updateData) {
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
    SOCKET_DISCONTINUE_DIAGNOSIS(state, dispatchId) {
      console.log("SOCKET_DISCONTINUE_DIAGNOSIS")
      const newList = state.list.filter(item => {
        return item.id != dispatchId
      })
      state.list = newList
    }
  },
  actions: {
    async addDiagnosis({ commit }, json) {
      const { data, toast } = json

      commit("addNewDiagnosis", data)

      try {
        const response = await fetch(DIAGNOSIS_API_URL, {
          method: "POST",
          headers: {
            "Content-Type": "application/json;charset=utf-8",
            "Authorization": "Bearer " + TOKEN
          },
          body: JSON.stringify(data)
        })
        if (!response.ok) {
          toast.toast("Failed to add diagnosis data", {
            title: "Error",
            variant: "danger",
            solid: true
          })
          commit("removeNewDiagnosis")
        }
      } catch (ex) {
        toast.toast("Server connection error", {
          title: "Error",
          variant: "danger",
          solid: true
        })
        commit("removeNewDiagnosis")
      }
    },
    async updateDiagnosis({ state, commit }, json) {
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

      commit("setDiagnosisList", newList)
      try {
        const response = await fetch(`${DIAGNOSIS_API_URL}/${data.id}`, {
          method: "PUT",
          headers: {
            "Content-Type": "application/json;charset=utf-8",
            "Authorization": "Bearer " + TOKEN
          },
          body: JSON.stringify(data)
        });
        if (!response.ok) {
          toast.toast("Failed to update diagnosis data", {
            title: "Error",
            variant: "danger",
            solid: true
          })

          commit("setDiagnosisList", originList)
        }
      } catch (ex) {
        toast.toast("Server connection error", {
          title: "Error",
          variant: "danger",
          solid: true
        })

        commit("setDiagnosisList", originList)
      }
    },
    async discontinueDiagnosis({ state, commit }, json) {
      const { data, toast } = json
      const originList = state.list
      const newList = originList.filter(item => {
        return item.id != data.id
      })

      commit("setDiagnosisList", newList)
      try {
        data["discontinue"] = true
        const response = await fetch(`${DIAGNOSIS_API_URL}/${data.id}`, {
          method: "PATCH",
          headers: {
            "Content-Type": "application/json;charset=utf-8",
            "Authorization": "Bearer " + TOKEN
          },
          body: JSON.stringify(data)
        });
        if (!response.ok) {
          toast.toast("Failed to discontinue diagnosis data", {
            title: "Error",
            variant: "danger",
            solid: true
          })

          commit("setDiagnosisList", originList)
        }
      } catch (ex) {
        toast.toast("Server connection error", {
          title: "Error",
          variant: "danger",
          solid: true
        })

        commit("setDiagnosisList", originList)
      }
    },
    async multidiscontinueDiagnosis({ state, commit }, json) {
      const { selectedIds, toast, selectedDatas } = json
      const originList = state.list
      const newList = originList.filter(item => {
        return !selectedIds.includes(item.id)
      })

      commit("setDiagnosisList", newList)


      selectedDatas.forEach(async item => {
        try {
          item['discontinue'] = true
          await fetch(`${DIAGNOSIS_API_URL}/${item.id}`, {
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
          commit('setDiagnosisList', originList)
        }
      })
    },
    async getDiagnoses({ commit }, json) {
      const { patientId, toast } = json
      if (TOKEN == null) {
        TOKEN = localStorage.getItem("token")
      }
      try {
        const response = await fetch(
          `${DIAGNOSIS_API_URL}?patientId=${patientId}`, {
          headers: {
            "Authorization": "Bearer " + TOKEN
          }
        }
        );
        if (response.ok) {
          let json = await response.json();
          commit('setDiagnosisList', json)
        } else {
          if (response.status == '401') {
            toast.toast("Token is expired", {
              title: "Error",
              variant: "danger",
              solid: true
            })
            localStorage.removeItem("token")
            window.location = "/"
          } else {
            toast.toast("Failed to get diagnosis data", {
              title: "Error",
              variant: "danger",
              solid: true
            })
          }
        }
      } catch (ex) {
        toast.toast("Server connection error", {
          title: "Error",
          variant: "danger",
          solid: true
        })
      }
    }
  },
  getters: {
    diagnoses(state) {
      return state.list.filter(item => {
        return item.discontinue != true
      })
    },
    panelDiagnoses(state) {
      return state.list.filter(item => {
        const itemDate = new Date(item.createdAt)
        return item.discontinue != true && itemDate <= state.currentDate
      })
    }
  }
}