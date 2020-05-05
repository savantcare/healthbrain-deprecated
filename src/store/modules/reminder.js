import { REMINDER_API_URL } from "@/const.js"

export default {
  state: {
    list: []
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
    }
  },
  actions: {
    async saveReminder({ commit }, json) {
      const { data, toast } = json

      commit("addNewReminder", data)

      try {
        const response = await fetch(REMINDER_API_URL, {
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
        const response = await fetch(`${REMINDER_API_URL}/${data.id}`, { method: "DELETE" });
        if (!response.ok) {
          toast.toast("Failed to discontinue data", {
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
      const { data, toast } = json
      const originList = state.list
      const newList = originList.filter(item => {
        return !data.includes(item.id)
      })

      commit("setReminderList", newList)


      data.forEach(async item => {
        try {
          await fetch(`${REMINDER_API_URL}/${item}`, {
            method: "DELETE"
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
      try {
        const response = await fetch(
          `${REMINDER_API_URL}?patientId=${patientId}`
        );
        if (response.ok) {
          let json = await response.json();
          console.log(json)
          commit('setReminderList', json)
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