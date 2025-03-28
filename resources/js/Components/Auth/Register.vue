<template>
    <div class="registerForm">
        <h2>Регистрация</h2>
        <p v-if="error">{{ error }}</p>
        <input v-model="name" placeholder="Имя" />
        <input v-model="email" placeholder="Email" />
        <input v-model="password" type="password" placeholder="Пароль" />
        <input v-model="password_confirmation" type="password" placeholder="Подтверждение пароля" />
        <button @click="register">Зарегистрироваться</button>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: "Register",
    data() {
        return {
            name: '',
            email: '',
            password: '',
            password_confirmation: '',
            error: null
        };
    },
    methods: {
        async register() {
            try {
                await axios.get('/sanctum/csrf-cookie');
                const response = await axios.post('/api/register', {
                    name: this.name,
                    email: this.email,
                    password: this.password,
                    password_confirmation: this.password_confirmation
                });

                localStorage.setItem('token', response.data.token);
                this.$router.push('/dashboard');
            } catch (err) {
                this.error = err.response?.data?.message || 'Ошибка регистрации';
            }
        }
    }
};
</script>

<style scoped>
.registerForm {
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
