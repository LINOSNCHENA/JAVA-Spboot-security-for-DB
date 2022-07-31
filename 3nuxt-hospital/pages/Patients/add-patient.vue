<template>
    <div class="container">
        <div class="header">
            <nuxt-link to="/"><span class="x-close">X</span>close</nuxt-link>
        </div>

        <h1>Add new patient</h1>
         <div class="form">
            <p class="grid-left">First name: </p>
            <div class="grid-right">
                <input type="text" v-model="first_name" placeholder="first name" class="form-input">
            </div>

            <p class="grid-left">Last name: </p>
            <div class="grid-right">
                <input type="text" v-model="last_name" placeholder="last name" class="form-input">
            </div>

            <p class="grid-left">Alergic: </p> 
            <div class="grid-right">
                <select v-model="alergic" class="select-box">
                    <option :value="null" selected disabled>select</option>
                    <option value="true">True</option>
                    <option value="false">False</option>
                </select>
            </div>

            <p class="grid-left">Vaccination centre: </p>
            <div class="grid-right">
                <select v-model="center" class="select-box">
                    <option :value="null" selected disabled>select</option>
                    <option v-for="center in centers" :key="center.id" :value="center.id">{{ center.vaccination_centre }}</option>
                </select>
            </div>
            
            
            <p class="grid-left">Vaccination type: </p>
            <div class="grid-right">
                <input type="text" v-model="type" placeholder="e.g.: Moderna" class="form-input">
            </div>

        </div>

        <div class="form-submit">
            <div class="flex-box">
                <span 
                    v-on:click="submitForm"
                    class="btn btn-submit" 
                    v-bind:class="{ sending: submiting }"
                    >Submit</span>
            </div>
            <p v-if="error" class="errorText">Odoslanie neuspešné. Skontrolujte a vyplnte všetky položky</p>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
import config from '../../components/ApiConfig'
    export default {
        name: "AddPatient",

        data() {
            return {
                config,
                centers: null,
                center: null,
                first_name: null,
                last_name: null,
                alergic: null,
                type: null,
                error: false,
                submiting: false,
            }
        },

        async created () {

            let id = this.$route.params.id

            //  get list of Centers
            try {
                const res2 = await axios.get(`https://hyperia-hospital.herokuapp.com/centers/`, config)
                this.centers = res2.data
            } catch (error) {
                console.log(error) 
            }
        },

        methods: {
            submitForm() {
                this.submiting = true

                console.log('lets submit form ...')

                let id = this.$route.params.id
                let data ={
                    first_name: this.first_name,
                    last_name: this.last_name,
                    vaccination_number: 1,
                    vaccination_centre: this.center,
                    is_allergic: this.alergic,
                    vaccine_type: this.type
                }

                console.log('data before submit: ', data)

                axios.post('https://hyperia-hospital.herokuapp.com/patient-entry/', data, config)
                .then(response => {
                    console.log('malo by uspesne odoslat: ', response)
                    this.submiting = false
                    
                    // redirect
                    this.$router.push('/')
                })
                .catch(error => {
                    // this.errorMessage = error.message;
                    console.error("There was an error!", error);
                    this.submiting = false
                    
                    // show error message
                    this.error = true
                });
            }
        },
    }
</script>

<style scoped>
.flex-box{
    display: flex;
    justify-content: center;
}
/* Grid */
.grid-left{
    text-align: right;
    margin-right: 7px;
}

.grid-right{
    margin: auto 0;
}
/* Form */
.form {
    display: grid;  
    grid-template-columns: 1fr 1fr;
}
.form-submit{
    margin: 30py;
}
.errorText{
 color:red;
 text-align: center;
 margin: 0;
}
</style>