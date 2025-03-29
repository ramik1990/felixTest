<template>
    <div class="card" style="width: 100%; position: relative;">
        <img :src="knife.imageUrl" class="card-img-top" :alt="knife.title">
        <div class="card-body d-flex flex-column">
          <h5 class="card-title">{{ knife.title }}</h5>
          <p class="card-text">{{ knife.description }}</p>
          <p class="price">{{ knife.price }} рублей</p>
          <a href="#" class="btn btn-primary mt-auto" @click.prevent="addToCart(knife.id)">В корзину</a>
        </div>
      </div>
</template>

<script>
import axios from 'axios';

export default {
    props: ['knife'],
    name: "KnifeCard",
    data() {
        return {

        }
    },
    methods: {
        addToCart(id) {
            axios.post('/api/cart/add', { 'knife_id': id, 'quantity': 1 })
            .then(response => {
                console.log(response.data);
            }); 
        }
    },
    created() {
        
    },
}
</script>

<style scoped>
.card-text {
    height: 160px;
    overflow: hidden;          /* Обрезаем лишний текст */
    text-overflow: ellipsis;   /* Добавляем многоточие */
}
.price {
    width: 100%;
    background-color: rgb(225, 237, 248);
    text-align: center;
    position: absolute;
    color: red;
    font-weight: bold;
    top: 160px;
    left: 0;
}
</style>