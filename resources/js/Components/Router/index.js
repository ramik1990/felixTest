import { createRouter, createWebHistory } from "vue-router";
import routes from "./routes";

const router = createRouter({
    history: createWebHistory(),
    routes
});


//Защита роутов
router.beforeEach((to, from, next) => {
    const isAuthenticated = localStorage.getItem('token'); // Проверяем токен
    if (to.meta.requiresAuth && !isAuthenticated) {
        next('/login');
    } else {
        next();
    }
});

export default router;