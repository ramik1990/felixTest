<template>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item">
                <router-link class="nav-link" :class="{ active: isActive('/') }" aria-current="page" to="/">Главная</router-link>
              </li>
              <li class="nav-item">
                <router-link class="nav-link" :class="{ active: isActive('/about') }" to="/about">О нас</router-link>
              </li>
              <li class="nav-item">
                <router-link class="nav-link" :class="{ active: isActive('/dashboard') }" to="/dashboard">Личный кабинет</router-link>
              </li>
            </ul>
          </div>
        </div>
      </nav>
</template>

<script>
export default {
    name: "MainMenu",
    computed: {
        currentRoute() {
            return this.$route.path;
        }
    },
    methods: {
        isActive(route) {
            this.currentRoute === route;
        }
    },
}
</script>

<style scoped>
nav {
    width: 100%;
    height: 50px;
}
</style>