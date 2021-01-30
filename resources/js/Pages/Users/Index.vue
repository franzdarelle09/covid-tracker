<template>
    <Layout>
        <div class="mx-auto max-w-7xl my-8">
          
            <!-- component -->
            <div class="text-gray-900 bg-gray-200">
                <div class="p-4 flex">
                    <h1 class="text-3xl">
                        Users
                    </h1>
                </div>
                <div class="px-3 py-4 flex justify-center">
                    <table class="w-full text-md bg-white shadow-md rounded mb-4">
                        <tbody>
                            <tr class="border-b">
                                <th class="text-left p-3 px-5">Name</th>
                                <th class="text-left p-3 px-5">Email</th>
                                <th class="text-left p-3 px-5">Phone</th>
                               
                            </tr>
                            <tr :class="[(index%2 == 0) && 'bg-gray-100','border-b hover:bg-orange-100']" v-for="(user,index) in users" :key="user.id">
                                <td class="p-3 px-5">{{user.fname}} {{user.lname}}</td>
                                <td class="p-3 px-5">{{user.email}}</td>
                                <td class="p-3 px-5">{{user.phone}} </td>
                              
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
    props: ['users'],
    components:{
        Layout
    }
}
</script>