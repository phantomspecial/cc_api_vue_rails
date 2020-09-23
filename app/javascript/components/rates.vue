<template>
  <div id="rates">
    <h2>Rate and Values</h2>
    <v-simple-table id="rates_values_table" dense>
      <thead>
        <tr>
          <th>Currency</th>
          <th>Rate</th>
          <th>Stock</th>
          <th>Value</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(rate, pair) in values.rates" v-bind:id="rate">
          <td>{{ pair | pair_name }}</td>
          <td>{{ rate }}</td>
          <td>{{ get_stock(pair) }}</td>
          <td>{{ current_value(rate, pair) | addComma }}</td>
        </tr>
      </tbody>
    </v-simple-table>

    <v-simple-table id="net_assets" dense>
      <tbody>
        <tr>
          <th>VC Total</th>
          <td>{{ vc_total_yen | addComma }}</td>
        </tr>
        <tr>
          <th>JPY</th>
          <td>{{ jpy_stock | addComma }}</td>
        </tr>
        <tr>
          <th>Net Assets</th>
          <td>{{ get_net_assets() | addComma }}</td>
        </tr>
      </tbody>
    </v-simple-table>
  </div>
</template>

<script>
export default {
  name: 'Rates',
  props: [
    'values'
  ],
  data: function () {
    return {
      vc_total_yen: 0,
      jpy_stock: 0
    }
  },
  beforeUpdate() {
    this.get_total_vc()
    this.get_jpy()
  },
  methods: {
    current_value: function (rate, pair) {
      let stock = this.get_stock(pair)
      return Math.floor(stock * parseFloat(rate))
    },
    get_stock: function (pair) {
      return parseFloat(this.values.balance[pair.replace('_jpy_rate', '')])
    },
    get_total_vc: function () {
      let total_yen = 0;
      let self = this
      let rates = this.values.rates
      Object.keys(rates).forEach(function (pair) {
        let rate = rates[pair]
        total_yen += self.current_value(rate, pair)
      })
      this.vc_total_yen = total_yen
    },
    get_jpy: function () {
      this.jpy_stock = parseInt(this.values.balance.jpy)
    },
    get_net_assets: function () {
      return this.vc_total_yen + this.jpy_stock
    }
  }
}
</script>

<style scoped lang="scss">
  #rates {
    padding-left: 10px;
    padding-right: 10px;
  }
  #net_assets {
    padding-top: 50px;
  }
</style>
