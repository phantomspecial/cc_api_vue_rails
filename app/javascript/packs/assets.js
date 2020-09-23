import Vue from 'vue'
import Assets from '../assets'
import Vuetify from "vuetify";

import "vuetify/dist/vuetify.min.css"
import "../../assets/stylesheets/_common.scss"
import "../filters/filters"

Vue.use(Vuetify);
const vuetify = new Vuetify(); // 追加

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    vuetify,
    render: h => h(Assets)
  }).$mount()
  document.body.appendChild(app.$el)
})
