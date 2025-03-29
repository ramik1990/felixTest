<template>
    <div style="text-align: center;">
        <h2>Личный кабинет</h2>
        <p v-if="user">Добро пожаловать, {{ user.name }}</p>
    </div>
    <knife-form />
</template>

<script>
import axios from 'axios';
import AddKnifeForm from '../Knifes/AddKnifeForm.vue';

export default {
    name: "Dashboard",
    components: {
        'knife-form' : AddKnifeForm
    },
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