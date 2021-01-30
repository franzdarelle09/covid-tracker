<template>
    <Layout>
        <div class="mx-auto max-w-4xl my-8">
            <div class="flex justify-end">
            
            </div>
            <!-- component -->
        
            <div v-if="Object.keys(errors).length > 0" id="error-alert" class="relative py-3 pl-4 pr-10 leading-normal text-red-100 bg-red-700 rounded-lg mb-4" role="alert">
                <p>{{ errors[Object.keys(errors)[0]] }}</p>
                <span class="absolute inset-y-0 right-0 flex items-center mr-4">
                    <svg class="w-4 h-4 fill-current" role="button" viewBox="0 0 20 20" @click="hideError()"><path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" fill-rule="evenodd"></path></svg>
                </span>
            </div>
            
            <div v-if="$page.props.flash.message" id="success-alert" class="relative py-3 pl-4 pr-10 leading-normal text-red-700 bg-red-100 rounded-lg mb-4" role="alert">
                <p>{{ $page.props.flash.message }}</p>
                <span class="absolute inset-y-0 right-0 flex items-center mr-4">
                    <svg class="w-4 h-4 fill-current" role="button" viewBox="0 0 20 20" @click="hideAlert()"><path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" fill-rule="evenodd"></path></svg>
                </span>
            </div>
            <div class="text-gray-900 bg-gray-200">
                <div class="p-4 flex justify-center">
                    <h1 class="text-3xl">
                        {{ business.business_name }}
                    </h1>
                </div>
                <div class="px-3 py-4 flex justify-center flex-col">
                  <div class="flex flex-col mb-4">
                    <label class="mb-2 uppercase font-bold text-lg text-grey-darkest" for="first_name">First Name</label>
                    <input class="border py-2 px-3 text-grey-darkest w-full" type="text"  v-model="form.fname">
                  </div>
                  <div class="flex flex-col mb-4">
                    <label class="mb-2 uppercase font-bold text-lg text-grey-darkest" for="first_name">Last Name</label>
                    <input class="border py-2 px-3 text-grey-darkest w-full" type="text"  v-model="form.lname">
                  </div>
                  <div class="flex flex-col mb-4">
                    <label class="mb-2 uppercase font-bold text-lg text-grey-darkest" for="first_name">Phone</label>
                    <input class="border py-2 px-3 text-grey-darkest w-full" type="text"  v-model="form.phone">
                  </div>
                    <button @click="logUser()" 
                        type="button"
                        class="border border-indigo-500 bg-indigo-500 text-white rounded-md px-4 py-2 m-2 transition duration-500 ease select-none hover:bg-indigo-600 focus:outline-none focus:shadow-outline ml-0"
                    >
                        Log
                    </button>
                </div>

                
            </div>
        </div>
    </Layout>
</template>
<script>
import Layout from '../../Shared/Layout.vue'
export default {
    props: ['errors','business','message'],
    data(){
        return {
            form: {
                business_id: this.business.id,
                link: this.business.link,
                fname: '',
                lname: '',
                phone: ''
            }
        }
    },
    methods: {
        logUser(){
            
            this.$inertia.post('/business-details',this.form)
            .then((res) => {
                this.form.fname = '';
                this.form.lname = '';
                this.form.phone = '';
                
            })
            
        },
        hideAlert(){
            this.$page.props.flash.message  = false;
        },
        hideError(){
            this.errors = false;
        },
       
    },
    components:{
        Layout
    }
}
</script>