<template>
    <div>
        <h2>Личный кабинет</h2>
        <p v-if="user">Добро пожаловать, {{ user.name }}</p>
        <button @click="logout">Выйти</button>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: "Dashboard",
    data() {
        return {
            user: null
        };
    },
    mounted() {
        this.fetchUser();
    },
    methods: {
        async fetchUser() {
            try {
                const response = await axios.get('/api/user', {
                    headers: { Authorization: `Bearer ${localStorage.getItem('token')}` }
                });
                this.user = response.data;
            } catch {
                this.$router.push('/login');
            }
        },
        async logout() {
            await axios.post('/api/logout', null, {
                headers: { Authorization: `Bearer ${localStorage.getItem('token')}` }
            });

            localStorage.removeItem('token');
            this.$router.push('/login');
        }
    }
};
</script>