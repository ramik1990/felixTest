<template>
    <h2>Корзина</h2>
    <div class="cartPage mt-5">
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>№</th>
                    <th>Название</th>
                    <th>Изображение</th>
                    <th>Цена</th>
                    <th>Количество</th>
                    <th>Сумма</th>
                    <th>Прочее</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(item, index) in knives" :key="index">
                    <td>{{ index + 1 }}</td>
                    <td>{{ item.title }}</td>
                    <td><img :src="'storage/'+item.imageUrl" :alt="item.title" style="width: 150px"></td>
                    <td>{{ item.price }}</td>
                    <td>{{ item.pivot.quantity }}</td>
                    <td>{{ item.price * item.pivot.quantity }}</td>
                    <td>
                        <a href="#" class="deleteBtn" title="Удалить" @click.prevent="deleteKnive(item.id)">❌</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="7" style="text-align: right;"><b>Итого к оплате:</b> {{ summ }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: "Cart",
    data() {
        return {
            knives: []
        }
    },
    methods: {
        getCart() {
            axios.get('/api/cart').then(response => {
                console.log(response.data.knives);
                this.knives = response.data.knives;
            });
        },
        deleteKnive(id) {
            alert(id);
        }
    },
    computed: {
        summ() {
            let s = 0;
            this.knives.forEach(element => {
                s = element.price * element.pivot.quantity + s;
            }); 
            return s;
        }
    },
    created() {
        this.getCart();
    },
}
</script>

<style scoped>
.cartPage {
    width: 100%;
}
.deleteBtn {
    text-decoration: none;
    font-size: 20px;
}
</style>