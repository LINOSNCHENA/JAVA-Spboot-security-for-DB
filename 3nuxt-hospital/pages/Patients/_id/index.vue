<template>
    <!-- Patient -->
    <div>
        <!-- x close -->
        <div class="header">
            <nuxt-link to="/"><span class="x-close">X</span>close</nuxt-link>
        </div>
        <!-- loading spinner -->
        <div v-if="loading">
            <loading-spinner></loading-spinner>
        </div>
        <div v-else-if="patient">
            <!-- form -->
            <h1 class="header-text">{{ patient.first_name }} {{ patient.last_name }}</h1>
            <p class="text-center">
                Absolved vaccine: {{ patient.vaccination_number }}
            </p>
            <!-- form-body -->
            <div class="grid-container">
                <!-- alergic -->
                <p class="grid-left">Alergic: </p> 
                <div class="grid-right">
                    <select v-model="selected_alergic" class="select-box">
                        <option value="true">True</option>
                        <option value="false">False</option>
                    </select>
                </div>
                <!-- centre -->
                <p class="grid-left">Vaccination centre: </p>
                <div class="grid-right">
                    <select v-model="selected_center" class="select-box">
                         <option :value="null" selected disabled>select</option>
                        <option v-for="center in centers" :key="center.id" :value="center.id">{{ center.vaccination_centre }}</option>
                    </select>
                </div>
                <!-- type -->
                <p class="grid-left">Vaccination type: </p>
                <div class="grid-right">
                    <input type="text" v-model="selected_vacc_type">
                </div>
            </div>
            <!-- Submit btn -->
            <div class="submit">
                <p 
                v-on:click="submitForm"
                class="btn btn-submit" 
                v-bind:class="{ sending: submiting }"
                >Submit</p>
            </div>
            <p v-if="message">{{ message_text}}</p>
        </div>
        <!-- No data -->
        <div v-else>
            <h3>No data &#128512;</h3>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
import config from './../../../components/ApiConfig'
import LoadingSpinner from '~/components/Loading-spinner.vue';

export default {
  components: { LoadingSpinner },
    data() {
        return {
            config,
            loading: false,
            submiting: false,
            message: false,
            message_text: '',
            patient: null,
            centers: null,
            selected_center: null,
            selected_alergic: null,
            selected_vacc_type: null
        }
    },
    async created () {
        this.loading = true
        this.fetchData()
    },
    methods: {
        // (2) GET requests
        // get Patient's data
        // get list of Centers
        fetchData(){
            let patient = 'https://hyperia-hospital.herokuapp.com/patients/'
            let centers = 'https://hyperia-hospital.herokuapp.com/centers/'
            let id = this.$route.params.id
            const requestPatient = axios.get(patient+id, config)
            const requestCenters = axios.get(centers, config)
            // request
            axios
                .all([requestPatient, requestCenters])
                .then(
                    // save repsponses
                    axios.spread((...responses) => {
                    const responsePatient = responses[0].data
                    const responseCenters = responses[1].data
                    this.patient = responsePatient
                    this.centers = responseCenters
                    // set Form inputs value
                    this.setPatientData()
                    this.loading = false
                    })
                )
                .catch(errors => {
                    // react on error
                    console.error(errors)
                    this.loading = false
                });

        },
        // set Form's inputs value
        setPatientData(){
            this.selected_center = this.patient.vaccination_centre
            this.selected_alergic = this.patient.is_allergic
            this.selected_vacc_type = this.patient.vaccine_type
        },
        // submit Form
        submitForm() {
            this.submiting = true
            let id = this.$route.params.id
            // data
            let data = {
                first_name: this.patient.first_name,
                last_name: this.patient.last_name,
                vaccination_number: this.patient.vaccination_number + 1,
                vaccination_centre: this.selected_center,
                is_allergic: this.selected_alergic,
                vaccine_type: this.selected_vacc_type
            }
            console.log('data before submit: ', data)
            // axios PUT request
            axios.put(`https://hyperia-hospital.herokuapp.com/patients/${id}`, data, this.config)
            .then(response => {
                this.message_text = 'Úspešne odoslané.'
                // increment user's vacc_number
                this.patient.vaccination_number += 1
            })
            .catch(error => {
                // react on error
                this.message_text = 'Chyba. Prosím skontrolujte všetky polia'
                console.error("There was an error!", error)
            })
            .then(() => {
                this.message = true
                this.submiting = false
            });
        }
    }
}
</script>

<style scoped>
.grid-container {
    display: grid;  
    grid-template-columns: 1fr 1fr;
}
.header-text{
    text-align: center;
}
.grid-left{
    text-align: right;
    margin-right: 10px;
}
.grid-right{
    margin: auto 0;
    text-align: left;
}
.submit{
    margin: auto;
    width: 120px;
}
.select-box{
    padding: 5px 10px;
    border-radius: 4px;
}
p{
    text-align: center;
}
</style>