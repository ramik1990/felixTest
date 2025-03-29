import Home from "../MainPage/Home.vue";
import About from "../MainPage/About.vue";
import Dashboard from "../Dashboard/Dashboard.vue";
import Register from "../Auth/Register.vue";
import Login from "../Auth/Login.vue";
import KnifePage from "../MainPage/KnifePage.vue";

const routes = [
    {
        path: '/',
        component: Home
    },
    {
        path: '/about',
        component: About
    },
    {
        path: '/dashboard',
        component: Dashboard,
        meta: {requiresAuth: true}
    },
    {
        path: '/register',
        component: Register
    },
    {
        path: '/login',
        component: Login
    },
    {
        path: '/knifes',
        component: KnifePage
    }
];


export default routes;