<template>
  <div id="topbar">
    <ul class="bar left">
      <li>Coincheck P/L Tool</li>
    </ul>
    <ul class="bar center">
      <li>Topmenu</li>
      <li>Submenu</li>
    </ul>
    <ul class="bar right">
      <li>Login</li>
      <li>Logout</li>
    </ul>
  </div>
</template>

<style scoped lang="scss">
  #topbar {
    height: 50px;
    width: 100%;
    position: fixed;
    top: 0;
    background-image: linear-gradient(to top, #00c6fb 0%, #005bea 100%);
    display: flex;
    line-height: 3rem;

    .text-set {
      color: #FFFFFF;
    }
    a {
      color: #FFFFFF;
      text-decoration: none;
    }
    ul.bar {
      list-style: none;
      color: #fff;
    }
    ul.bar.right {
      margin-left: auto;
    }

    ul.bar.center,
    ul.bar.right {
      display: flex;
      > li:not(:first-child) {
        padding-left: 20px;
        padding-right: 20px;
      }
    }
  }
</style>
