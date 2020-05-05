import { REMINDER_API_URL } from "@/const.js"

export default {
  state: {
    list: []
  },
  mutations: {
    setReminderList(state, data) {
      const queryString = window.location.search;
      const urlParams = new URLSearchParams(queryString);
      const patientId = urlParams.get("patient_id");
      let newList = []
      state.list.forEach(item => {
        if (item.patientId != patientId) {
          newList.push(item)
        }
      })
      if (data.length > 0) {
        data.forEach(item => {
          newList.push(item)
        })
      }

      state.list = newList
    }
  },
  actions: {
    async saveReminder({ state }, json) {
      const { data, toast } = json
      state.list.push(data)

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
          state.list.pop()
        }
      } catch (ex) {
        toast.toast("Server connection error", {
          title: "Error",
          variant: "danger",
          solid: true
        })
        state.list.pop()
      }
    },
    async updateReminder({ state }, json) {
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
      state.list = newList
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
          state.list = originList
        }
      } catch (ex) {
        toast.toast("Server connection error", {
          title: "Error",
          variant: "danger",
          solid: true
        })
        state.list = originList
      }
    },
    async discontinueReminder({ state }, json) {
      const { data, toast } = json
      const originList = state.list
      const newList = originList.filter(item => {
        return item.id != data.id
      })
      state.list = newList
      try {
        const response = await fetch(`${REMINDER_API_URL}/${data.id}`, { method: "DELETE" });
        if (!response.ok) {
          toast.toast("Failed to discontinue data", {
            title: "Error",
            variant: "danger",
            solid: true
          })
          state.list = originList
        }
      } catch (ex) {
        toast.toast("Server connection error", {
          title: "Error",
          variant: "danger",
          solid: true
        })
        state.list = originList
      }
    },
    async multidiscontinueReminder({ state }, json) {
      const { data, toast } = json
      const originList = state.list
      const newList = originList.filter(item => {
        return !data.includes(item.id)
      })
      state.list = newList


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
          state.list = originList
        }
      })
    },
    async getReminders({ state }, json) {
      const { patientId, toast } = json
      try {
        const response = await fetch(
          `${REMINDER_API_URL}?patientId=${patientId}`
        );
        if (response.ok) {
          let json = await response.json();
          state.list = json
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