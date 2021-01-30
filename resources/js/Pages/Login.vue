<template>
    <div class="flex justify-center w-screen">
       
        <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 flex flex-col w-3/4 mt-32">
            <form method="post" @submit.prevent="signIn()">
                <div v-if="Object.keys(errors).length > 0" id="error-alert" class="relative py-3 pl-4 pr-10 leading-normal text-red-100 bg-red-700 rounded-lg mb-4" role="alert">
                    <p>{{ errors[Object.keys(errors)[0]] }}</p>
                    <span class="absolute inset-y-0 right-0 flex items-center mr-4">
                        <svg class="w-4 h-4 fill-current" role="button" viewBox="0 0 20 20" @click="hideError()"><path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" fill-rule="evenodd"></path></svg>
                    </span>
                </div>

                <div v-if="$page.props.flash.err" id="error-alert" class="relative py-3 pl-4 pr-10 leading-normal text-red-100 bg-red-700 rounded-lg mb-4" role="alert">
                    <p>{{ $page.props.flash.err }}</p>
                   
                </div>
                <div class="mb-4 flex justify-center font-bold text-3xl">
                    <h1>Covid Tracker</h1> 
                </div>
                <div class="mb-4">
                <label class="block text-grey-darker text-sm font-bold mb-2" for="username">
                    Email
                </label>
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-grey-darker" id="username" type="email" v-model="form.email" placeholder="Email">
                </div>
                <div class="mb-6">
                <label class="block text-grey-darker text-sm font-bold mb-2" for="password">
                    Password
                </label>
                <input class="shadow appearance-none border border-red rounded w-full py-2 px-3 text-grey-darker mb-3" id="password" v-model="form.password" type="password" placeholder="******************">
                <p class="text-red text-xs italic">Please choose a password.</p>
                </div>
                <div class="flex items-center justify-between">
                <button type="submit" class="border border-indigo-500 bg-indigo-500 text-white rounded-md px-4 py-2 m-2 transition duration-500 ease select-none hover:bg-indigo-600 focus:outline-none focus:shadow-outline ml-0">
                    Sign In
                </button>
            
                </div>
            </form>
        </div>
        
    </div>
</template>
<script>
export default {
    props: ['errors'],
    data(){
        return {
            form: {
                email:'',
                password:''
            }
        }
    },
    methods: {
        signIn(){
            this.$inertia.post('/login',this.form)
            .then((res) => {

            })
        },
        hideError(){
            this.errors = false;
        },
    }
}
</script>