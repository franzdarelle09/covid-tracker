<template>
    <Layout>
        <div class="mx-auto max-w-4xl my-8">
            <div class="flex justify-end">
            
            </div>
            <!-- component -->
            <div class="text-gray-900 bg-gray-200">
                <div class="p-4 flex justify-center">
                    <h1 class="text-3xl">
                        Create Businesses
                    </h1>
                </div>
                <div class="px-3 py-4 flex justify-center flex-col">
                  <div class="flex flex-col mb-4">
                    <label class="mb-2 uppercase font-bold text-lg text-grey-darkest" for="first_name">Name</label>
                    <input class="border py-2 px-3 text-grey-darkest w-full" type="text"  v-model="form.business_name">
                  </div>
                    <button @click="createBusiness()" 
                        type="button"
                        class="border border-indigo-500 bg-indigo-500 text-white rounded-md px-4 py-2 m-2 transition duration-500 ease select-none hover:bg-indigo-600 focus:outline-none focus:shadow-outline ml-0"
                    >
                        Create Business
                    </button>
                </div>

                
            </div>
        </div>
    </Layout>
</template>
<script>
import Layout from '../../Shared/Layout.vue'
export default {
    data(){
        return {
            form: {
                business_name: ''
            }
        }
    },
    methods: {
        createBusiness(){
            this.$inertia.post('/business',this.form)
            .then((res) => {
                
            })
        }
    },
    components:{
        Layout
    }
}
</script>