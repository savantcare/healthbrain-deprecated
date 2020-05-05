import { STYLE_API_URL } from "@/const.js"
export default {
  state: {
    value: 1
  },
  actions: {
    async loadStyle({ state }) {
      const response = await fetch(STYLE_API_URL);
      if (response.ok) {
        const json = await response.json();
        state.value = json.value;
      }
    }
  }
}