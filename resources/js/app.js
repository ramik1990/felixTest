import './bootstrap';
import { createApp } from 'vue';
import router from './Components/Router';
import App from './Components/App.vue';

createApp(App).use(router).mount('#app');
