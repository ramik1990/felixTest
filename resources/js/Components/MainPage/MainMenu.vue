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
                <router-link class="nav-link" :class="{ active: isActive('/knifes') }" to="/knifes">Ножи</router-link>
              </li>
              <li class="nav-item">
                <router-link class="nav-link" :class="{ active: isActive('/cart') }" to="/cart">Корзина</router-link>
              </li>
              <li class="nav-item">
                <router-link class="nav-link" :class="{ active: isActive('/dashboard') }" to="/dashboard">Личный кабинет</router-link>
              </li>
              <li class="nav-item" v-if="!token" style="display: flex; position:absolute; right:0;">
                <router-link class="nav-link" :class="{ active: isActive('/login') }" to="/login">Войти</router-link>
                <router-link class="nav-link" :class="{ active: isActive('/register') }" to="/register">Регистрация</router-link>
              </li>
              <li class="nav-item" v-if="token">
                <a class="nav-link" style="display: flex; position:absolute; right:0;" @click.prevent="logout" :class="{ active: isActive('/dashboard') }" href="#">Выход</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
</template>

<script>
import axios from 'axios';

export default {
    name: "MainMenu",
    data() {
        return {
            token: ''
        }
    },
    computed: {
        currentRoute() {
            return this.$route.path;
        }
    },
    methods: {
        isActive(route) {           // проверка на текущий роут, чтоб задать активную ссылку
            this.currentRoute === route;
        },
        checkToken(){               // если нет токена тогда будем показывать кнопки Вход/Регистрация
            if(localStorage.getItem('token')) {
                this.token = localStorage.getItem('token');
            } else {
                this.token = '';
            }
        },
        async logout() {
          const response = await axios.post('/api/logout', null, {
            headers: { Authorization: `Bearer ${localStorage.getItem('token')}` }
          });
          localStorage.removeItem('token');
          console.log(response.data.message);
          this.$router.push('/');
        }
    },
    mounted() {
        this.checkToken();
    },
    watch: {
        $route(to, from) {
            this.checkToken();
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