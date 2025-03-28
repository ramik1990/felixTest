<template>
    <div class="loginForm">
        <h2>Вход</h2>
        <p v-if="error">{{ error }}</p>
        <input v-model="email" placeholder="Email" />
        <input v-model="password" type="password" placeholder="Пароль" />
        <button @click="login">Войти</button>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: "Login",
    data() {
        return {
            email: '',
            password: '',
            error: null
        };
    },
    methods: {
        async login() {
            try {
                await axios.get('/sanctum/csrf-cookie');
                const response = await axios.post('/api/login', {
                    email: this.email,
                    password: this.password
                });

                localStorage.setItem('token', response.data.token);
                this.$router.push('/dashboard');
            } catch (err) {
                this.error = err.response?.data?.message || 'Ошибка входа';
            }
        }
    }
};
</script>

<style scoped>
.loginForm {
    margin: 20px;
    width: 450px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    background-color: azure;
    gap: 5px;
}
</style>