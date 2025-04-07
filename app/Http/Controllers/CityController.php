<?php

namespace App\Http\Controllers;

use App\Models\Member;
use App\Models\State;
use App\Models\City;
use DB;
use Faker\Provider\ar_EG\Company;
use Illuminate\Http\Request;
use PDO;

class CityController extends Controller
{

    public function index()
    {
        $title = 'City';
        $get_city = DB::table('tbl_city as a')
        ->join('tbl_state as b', 'a.state_id', '=', 'b.id')
        ->select('a.*', 'b.title as state_name')
        ->where('b.status', 1)
        ->where('a.status', '!=', 3)->orderBy('a.id','desc')
        ->get();
        $state = State::where('status',1)->get();
        return view('state.city', compact('title', 'get_city','state'));
    }

    public function store_city(Request $request)
    {

        if ($request->hidden_id) {

            $check_data = $this->check_exist_data($request->title, $request->hidden_id);
            if ($check_data) {
                return redirect()->route('city')->with('error', 'City already exists.');
            }
            $city = City::findOrFail($request->hidden_id);
            $request->validate([
                'title' => 'required',
                'status' => 'required',
                'state_id' => 'required',
            ]);

            $city->title = $request->title;
            $city->state_id = $request->state_id;
            $city->status = $request->status;
            $city->update();
            return redirect()->route('city')->with('success', 'City updated successfully.');
        }
        $check_data =  $this->check_exist_data($request->title, null);
        if ($check_data) {
            return redirect()->route('city')->with('error', 'City  already exists.');
        }
        $request->validate([
            'status' => 'required',
            'title' => 'required',
            'state_id' => 'required',
        ]);
        $city = new City();
        $city->title = $request->title;
        $city->state_id = $request->state_id;
        $city->status = $request->status;
        $city->save();
        return redirect()->route('city')->with('success', 'City created successfully.');
    }

    public function edit_city($id)
    {
        $title = 'Edit City';
        $find_city = City::find($id);
        $get_city = DB::table('tbl_city as a')
        ->join('tbl_state as b', 'a.state_id', '=', 'b.id')
        ->select('a.*', 'b.title as state_name')
        ->where('b.status', 1)
        ->where('a.status', '!=', 3)->orderBy('a.id','desc')
        ->get();
        $state = State::where('status',1)->get();
        return view('state.city', compact('title', 'get_city', 'find_city','state'));
    }

    public function destroy_city($id)
    {
        $city = City::findOrFail($id);
        $city->status = 3;
        $city->update();
        return redirect()->route('city')->with('success', 'City deleted successfully.');
    }

    public function check_exist_data($title, $id)
    {
        if ($id != null && $title != null) {
            $check_city = City::where('title', $title)->where('status', '!=', 3)->where('id','!=',$id)->first();
            if ($check_city) {
                return true;
            }
        } else {
            $check_city = City::where('title', $title)->where('status', '!=', 3)->first();
            if ($check_city) {
                return true;
            }
        }
    }





}
