import { REMINDER_API_URL } from "@/const.js"
let TOKEN = localStorage.getItem("token")
export default {
  state: {                       // Cannot be changed directly. Can only be changed through mutation
    list: [],
    currentDate: new Date()
  },
  mutations: {
    setReminderList(state, data) {
      state.list = data
    },
    addNewReminder(state, data) {
      state.list.push(data)
    },
    removeNewReminder(state) {
      state.list.pop()
    },
    setReminderCurrentDate(state, value) {
      state.currentDate = value
    },

    /**
     * Socket Listeners
     */
    SOCKET_ON_UPDATE_REMINDERS(state, updateList) {   // Message received from socket server
      state.list = updateList
    },
    SOCKET_ADD_REMINDER(state, newData) {         // Msg recd from node-server/routes/reminder.route.js
      if (state.list.length > 0) {                      // At the client where this data was added it needs to be skipped
        const lastData = state.list[state.list.length - 1]
        if (lastData.reminderID == newData.reminderID) {
          return
        }
      }
      state.list.push(newData)
    },
    SOCKET_UPDATE_REMINDER(state, updateData) {
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
    SOCKET_DISCONTINUE_REMINDER(state, dispatchId) {
      console.log("SOCKET_DISCONTINUE_REMINDER")
      const newList = state.list.filter(item => {
        return item.id != dispatchId
      })
      state.list = newList
    }
  },
  actions: {
    async addReminder({ commit }, json) {
      const { data, toast } = json

      commit("addNewReminder", data)

      try {
        const response = await fetch(REMINDER_API_URL, {
          method: "POST",
          headers: {
            "Content-Type": "application/json;charset=utf-8",
            "Authorization": "Bearer " + TOKEN
          },
          body: JSON.stringify(data)
        })
        if (!response.ok) {
          toast.toast("Failed to add reminder data", {
            title: "Error",
            variant: "danger",
            solid: true
          })
          commit("removeNewReminder")
        }
      } catch (ex) {
        toast.toast("Server connection error", {
          title: "Error",
          variant: "danger",
          solid: true
        })
        commit("removeNewReminder")
      }
    },
    async updateReminder({ state, commit }, json) {
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

      commit("setReminderList", newList)
      try {
        const response = await fetch(`${REMINDER_API_URL}/${data.id}`, {
          method: "PUT",
          headers: {
            "Content-Type": "application/json;charset=utf-8",
            "Authorization": "Bearer " + TOKEN
          },
          body: JSON.stringify(data)
        });
        if (!response.ok) {
          toast.toast("Failed to update reminder data", {
            title: "Error",
            variant: "danger",
            solid: true
          })

          commit("setReminderList", originList)
        }
      } catch (ex) {
        toast.toast("Server connection error", {
          title: "Error",
          variant: "danger",
          solid: true
        })

        commit("setReminderList", originList)
      }
    },
    async discontinueReminder({ state, commit }, json) {
      const { data, toast } = json
      const originList = state.list
      const newList = originList.filter(item => {
        return item.id != data.id
      })

      commit("setReminderList", newList)
      try {
        data["discontinue"] = true
        const response = await fetch(`${REMINDER_API_URL}/${data.id}`, {
          method: "PATCH",
          headers: {
            "Content-Type": "application/json;charset=utf-8",
            "Authorization": "Bearer " + TOKEN
          },
          body: JSON.stringify(data)
        });
        if (!response.ok) {
          toast.toast("Failed to discontinue reminder data", {
            title: "Error",
            variant: "danger",
            solid: true
          })

          commit("setReminderList", originList)
        }
      } catch (ex) {
        toast.toast("Server connection error", {
          title: "Error",
          variant: "danger",
          solid: true
        })

        commit("setReminderList", originList)
      }
    },
    async multidiscontinueReminder({ state, commit }, json) {
      const { selectedIds, toast, selectedDatas } = json
      const originList = state.list
      const newList = originList.filter(item => {
        return !selectedIds.includes(item.id)
      })

      commit("setReminderList", newList)


      selectedDatas.forEach(async item => {
        try {
          item['discontinue'] = true
          await fetch(`${REMINDER_API_URL}/${item.id}`, {
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
          commit('setReminderList', originList)
        }
      })
    },
    async getReminders({ commit }, json) {
      const { patientId, toast } = json
      if (TOKEN == null) {
        TOKEN = localStorage.getItem("token")
      }
      try {
        const response = await fetch(
          `${REMINDER_API_URL}?patientId=${patientId}`, {
          headers: {
            "Authorization": "Bearer " + TOKEN
          }
        }
        );
        if (response.ok) {
          let json = await response.json();
          commit('setReminderList', json)
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
            toast.toast("Failed to get reminder data", {
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
    reminders(state) {
      return state.list.filter(item => {
        return item.discontinue != true
      })
    },
    panelReminders(state) {
      return state.list.filter(item => {
        const itemDate = new Date(item.createdAt)
        return item.discontinue != true && itemDate <= state.currentDate
      })
    }
  }
}