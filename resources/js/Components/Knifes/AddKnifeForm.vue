<template>
    <div class="addKnifeForm">
        <h3 class="mt-5">Добавить нож</h3>
        <form class="row g-3" @submit.prevent="submitForm">
            <div class="form-floating w-50 mx-auto">
                <input class="form-control form-control-m" id="knifeTitle" type="text" placeholder="Название ножа" v-model="knife.title" required>
                <label for="knifeTitle">Название ножа</label>
            </div>
            <div class="form-floating w-50 mx-auto">
                <textarea class="form-control" placeholder="Описание ножа" v-model="knife.description" id="aboutKnife" style="height: 150px" required></textarea>
                <label for="aboutKnife">Описание ножа</label>
            </div>
            <div class="mb-3 w-50">
                <label for="image" class="form-label">Загрузите изображение</label>
                <input class="form-control" type="file" id="image" accept="image/*" @change="handleFileUpload" required>
            </div>
            <button type="submit" class="btn btn-primary w-50 mb-3">Отправить</button>
        </form>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    name: "AddKnifeForm",
    data() {
        return {
            knife: {
                title: '',
                description: '',
                selectedFile: null
            }
        }
    },
    methods: {
        handleFileUpload(event) {
            const file = this.selectedFile = event.target.files[0];
            if(file) {
                this.knife.selectedFile = file;
            }
        },
        submitForm() {      // отправляем данные по ножу на сервер для добавления
            let formData = new FormData();
            formData.append('title', this.knife.title);
            formData.append('description', this.knife.description);
            formData.append('file', this.knife.selectedFile);
            axios.post('/api/uploadKnife', formData, {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            }).then(response => {
                console.log(response.data.message);
            });
        }
    },
}
</script>

<style scoped>
.addKnifeForm {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}
.addKnifeForm form {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    gap: 10px;
}

</style>