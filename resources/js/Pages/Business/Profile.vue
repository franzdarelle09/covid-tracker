<template>
    <Layout>
        <div class="mx-auto max-w-7xl my-8">
            
            <!-- component -->
            <div class="text-gray-900 bg-gray-200">
                <div class="p-4 flex justify-between">
                    <h1 class="text-3xl">
                        {{ business.business_name }}
                    </h1>
                    <div>
                        <input type="date" @change="changeDate()" v-model="date" />
                    </div>
                </div>
                <div class="px-3 py-4 flex justify-center">
                    <table class="w-full text-md bg-white shadow-md rounded mb-4">
                        <tbody>
                            <tr class="border-b">
                                <th class="text-left p-3 px-5">Name</th>
                                <th class="text-left p-3 px-5">Phone</th>
                                <th class="text-left p-3 px-5">Time Of Arrival</th>
                                
                                
                            </tr>
                            <tr :class="[(index%2 == 0) && 'bg-gray-100','border-b hover:bg-orange-100']" v-for="(h,index) in history" :key="h.id">
                                <td class="p-3 px-5">{{h.fname}} {{h.lname}}</td>
                                <td class="p-3 px-5">{{h.phone}}</td>                                
                                <td class="p-3 px-5">{{h.date_log}}</td>
                                
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
    props: ['history','business'],
    data(){
        return {
            date:''
        }
    },
    components:{
        Layout
    },
    created(){
        console.log(this.hist)
    },
    methods:{
        changeDate(){
            window.location=`/business/profile/${this.business.id}/${this.date}`
        }
    }
}
</script>