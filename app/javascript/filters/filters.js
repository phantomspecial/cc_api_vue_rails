import Vue from 'vue'
import moment from "moment";

Vue.filter('pair_name', function (pair_name) {
  return pair_name.replace('_jpy_rate', '').toUpperCase() ;
})

Vue.filter('addComma', function (value) {
  return value.toLocaleString();
})

Vue.filter('full_size_datetime', function (value) {
  if (value === null) {
    return 'Null'
  } else {
    return moment(value).format('YYYY/MM/DD hh:mm:ss')
  }
})
