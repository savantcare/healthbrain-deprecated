export default {
  state: {
    width: '30%',
    list: []
  },
  mutations: {
    setRightPanelWidth(state, value) {
      state.width = value
    },
    setRightPanelList(state, newList) {
      state.list = newList
    }
  }
}