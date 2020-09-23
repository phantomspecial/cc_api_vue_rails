<template>
  <v-app id="app">
    <TopBar></TopBar>
    <div class="body">
      <h1>Net Assets</h1>
      <Rates v-bind:values="{rates: rates, balance: balance}"></Rates>
    </div>
  </v-app>
</template>

<script>
import TopBar from './components/shared/topbar'
import Rates from './components/rates.vue'
import axios from 'axios';

export default {
  components: {
    TopBar,
    Rates
  },
  data: function () {
    return {
      balance: {},
      rates: {}
    }
  },
  mounted: function () {
    this.fetchPL();
    // let self = this;
    // setInterval(function () {
    //   self.fetchPL();
    // }, 5000)
  },
  methods: {
    fetchPL: function () {
      axios.get('api/v1/assets').then((response) => {
        this.balance = response.data.balance;
        this.rates = response.data.rates;
      }, (error) => {
        console.log(error)
      })
    }
  }
}
</script>

<style scoped lang="scss">
  .body {
    padding-top: 50px;
  }
</style>
