import '@babel/polyfill'
import 'mutationobserver-shim'
import Vue from 'vue'
import './plugins/bootstrap-vue'
import App from './App.vue'
import store from './store'
import router from './router'

Vue.config.productionTip = false  // Ref: https://forum.quasar-framework.org/topic/278/turn-off-the-annoying-vue-production-tip

new Vue({
  store,
  router,
  render: h => h(App)
}).$mount('#app')
