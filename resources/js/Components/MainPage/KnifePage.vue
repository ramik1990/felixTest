<template>
    <h2>Выберите свой нож</h2>
    <div class="knivesCards p-5">
        <knife-card class="cart" v-for="(item, index) in knives.data" :knife="item" :key="index"/>
    </div>
</template>

<script>
import axios from 'axios';
import KnifeCard from '../Knifes/KnifeCard.vue';

export default {
    components: {
        'knife-card' : KnifeCard
    },
    name: "KnifePage",
    data() {
        return {
            knives: ''
        }
    },
    methods: {
        getKnives(){
            axios.post('/api/getKnives').then(response => {
                console.log(response.data);
                this.knives = response.data;
            });
        }
    },
    created() {
        this.getKnives();
    },
}
</script>

<style scoped>
.knivesCards {
    width: 100%;
    display: grid;
    gap: 10px;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
}
.cart {
    height: 500px;
}
</style>