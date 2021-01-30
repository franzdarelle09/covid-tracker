<template>
    <Layout>
        <div class="mx-auto max-w-7xl my-8">
            <div class="flex justify-end">
            <inertia-link href="/business/create"
                class="border border-indigo-500 bg-indigo-500 text-white rounded-md px-4 py-2 m-2 transition duration-500 ease select-none hover:bg-indigo-600 focus:outline-none focus:shadow-outline ml-0"
            >
                Add Business
            </inertia-link>
            </div>
            <!-- component -->
            <div class="text-gray-900 bg-gray-200">
                <div class="p-4 flex">
                    <h1 class="text-3xl">
                        Businesses
                    </h1>
                </div>
                <div class="px-3 py-4 flex justify-center">
                    <table class="w-full text-md bg-white shadow-md rounded mb-4">
                        <tbody>
                            <tr class="border-b">
                                <th class="text-left p-3 px-5">Business Name</th>
                                <th class="text-left p-3 px-5">Link</th>
                                
                                <th></th>
                            </tr>
                            <tr :class="[(index%2 == 0) && 'bg-gray-100','border-b hover:bg-orange-100']" v-for="(b,index) in busi" :key="b.id">
                                <td class="p-3 px-5">{{b.business_name}}</td>
                                <td class="p-3 px-5"><inertia-link :href="`/business-details/${b.link}`">Link</inertia-link></td>                                
                                <td class="p-3 px-5 flex justify-end"><inertia-link :href="`/business/profile/${b.id}`" class="mr-3 text-sm bg-blue-500 hover:bg-blue-700 text-white py-1 px-2 rounded focus:outline-none focus:shadow-outline">Track</inertia-link><button @click="deleteBusiness(b.id)" type="button" class="text-sm bg-red-500 hover:bg-red-700 text-white py-1 px-2 rounded focus:outline-none focus:shadow-outline">Delete</button></td>
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </Layout>
</template>
<script>
import Layout from '../../Shared/Layout.vue'
export default {
    props: ['business'],
    data(){
        return {
            busi: this.business,
        }
    },
    components:{
        Layout
    },
    created(){
        console.log(this.business)
    },
    methods:{
        deleteBusiness(business_id){
            this.busi = this.busi.filter((b) => b.id != business_id);
            if (confirm('Are you sure you want to delete this business?')) {
                this.$inertia.delete(`/business/${business_id}`)
                .then(() => {

                })
            }
        }
    }
}
</script>