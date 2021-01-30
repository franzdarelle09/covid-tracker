<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
class UsersController extends Controller
{
    public function index()
    {
        $users = User::orderBy('fname','asc')->take(20)->get();
        return Inertia::render('Users/Index',['users' => $users]);
    }

    public function login(){
        return Inertia::render('Login');
    }
    public function checkLogin(Request $request){
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
    	if (Auth::attempt(['email' => $request->input('email'), 'password' => $request->input('password')],true)) {
            return redirect('/business');
		}else{
            $message = "whoops email or password is incorrect";
			return redirect('login')->with('err',$message);
		}

    }

    public function signout()
    {
    	Auth::logout();
    	return redirect('/login');
    }
}
