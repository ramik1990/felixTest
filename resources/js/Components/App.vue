<template>
    <main-menu />
    <section class="mainApp">
        <router-view></router-view>
    </section>
</template>

<script>
import MainMenu from './MainPage/MainMenu.vue';

export default {
    name: "App",
    components: {
        'main-menu' : MainMenu
    }
}
</script>

<style scoped>
.mainApp {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
</style>