<?php

namespace App\Http\Controllers;

use App\Models\Business;
use App\Models\History;
use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
class BusinessController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $business = Business::whereStatus(1)->orderBy('business_name','asc')->get();
        return Inertia::render('Business/Index',['business'  => $business]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return Inertia::render('Business/Create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'business_name' => 'required',
        ]);
        

        $slug = Str::of($request->business_name.' '.time())->slug('-');
        Business::create([
            'business_name' => $request->business_name,
            'link' => $slug
        ]);

        return redirect()->route('business.index')->with('message', 'Business was successfully added!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id){

    }

    public function profile($id, $date = '')
    {
        if($date == '') $date = Carbon::today()->toDateString();
        else $date = date('Y-m-d', strtotime($date));
        $business = Business::find($id);
        $history = History::whereBusinessId($id)->whereDate('created_at','=',$date)->orderBy('created_at','asc')->get();
        foreach($history as $key => $h){
            $history[$key]->fname = $h->user->fname;
            $history[$key]->lname = $h->user->lname;
            $history[$key]->phone = $h->user->phone;
            $history[$key]->date_log = date('F j, Y h:i:s',strtotime($history[$key]->created_at));
        }
        return Inertia::render('Business/Profile',['history' => $history,'business' => $business]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
       $business = Business::find($id);
       $business->status = 0;
       $business->save();
       return redirect()->route('business');
    }

    public function businessDetails($link){
        $business = Business::whereLink($link)->whereStatus(1)->first();
        if(!$business){
            return redirect('/');
        }
        return Inertia::render('Business/Details',['business' => $business]);
    }
    public function saveBusinessDetails(Request $request){
        $request->validate([
            'fname' => 'required',
            'lname' => 'required',
            'phone' => 'required',
        ]);
      
        //check if user exist and if not create one
        $user = User::where([
            ['fname', trim($request->fname)],
            ['lname', trim($request->lname)],
            ['phone', trim($request->phone)]
        ])->get();
        if($user->count()){
            $user_id = $user[0]->id;
        }else{
            //create a new user if it doesn't exist
            $u = new User;
            $u->fname = $request->fname; 
            $u->lname = $request->lname; 
            $u->phone = $request->phone; 
            $u->save();
            $user_id = $u->id;
        }
        //log it to history
        $history = new History;
        $history->user_id = $user_id;
        $history->business_id = $request->business_id;
        $history->save();
        return redirect()->route('business.details',['link' => $request->link])->with('message', 'Logged Successfully');
    }
}
