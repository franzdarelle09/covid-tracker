<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
class HomeController extends Controller
{
    public function index()
    {
        return Inertia::render('Welcome', [
            'foo' => 'bart'
        ]);
    }
    public function contact()
    {
        return Inertia::render('Contact');
    }
    public function about()
    {
        return Inertia::render('About');
    }
}
