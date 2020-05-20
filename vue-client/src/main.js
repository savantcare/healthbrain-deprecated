import '@babel/polyfill'
import 'mutationobserver-shim'
import Vue from 'vue'
import './plugins/bootstrap-vue'
import App from './App.vue'
import store from './store'
import router from './router'

// Initialize socket.io
import SocketIO from 'socket.io-client'
import VueSocketIO from 'vue-socket.io';
import { SOCKET_API_URL } from "@/const.js";

Vue.use(new VueSocketIO({
  debug: true,
  connection: SocketIO(SOCKET_API_URL, {}),
  vuex: {
    store,
    actionPrefix: "SOCKET_",
    mutationPrefix: "SOCKET_"
  }
})
);

import VueSplit from 'vue-split-panel'
Vue.use(VueSplit)

import { BootstrapVue, BootstrapVueIcons } from 'bootstrap-vue'

Vue.use(BootstrapVue)
Vue.use(BootstrapVueIcons)

const VueScrollTo = require('vue-scrollto')
Vue.use(VueScrollTo)

import { SliderPlugin } from "@syncfusion/ej2-vue-inputs";
Vue.use(SliderPlugin);

import './registerServiceWorker'

import VueGoodTablePlugin from 'vue-good-table';

// import the styles
import 'vue-good-table/dist/vue-good-table.css'

Vue.use(VueGoodTablePlugin);

import VueTabs from 'vue-nav-tabs'
import 'vue-nav-tabs/themes/vue-tabs.css'
Vue.use(VueTabs)

Vue.config.productionTip = false

new Vue({
  store,
  router,
  render: h => h(App)
}).$mount('#app')
