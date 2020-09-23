import Vue from 'vue'

Vue.filter('pair_name', function (pair_name) {
  return pair_name.replace('_jpy_rate', '').toUpperCase() ;
})

Vue.filter('addComma', function (value) {
  return value.toLocaleString();
})
