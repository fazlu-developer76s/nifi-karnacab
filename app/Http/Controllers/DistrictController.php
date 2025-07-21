<?php

namespace App\Http\Controllers;

use App\Models\Member;
use App\Models\District;
use App\Models\State;
use DB;
use Faker\Provider\ar_EG\Company;
use Illuminate\Http\Request;
use PDO;

class DistrictController extends Controller
{

    public function index()
    {
        $title = 'District';
        $get_district = DB::table('tbl_district')
            ->join('tbl_state', 'tbl_district.state_id', '=', 'tbl_state.id')
            ->select('tbl_district.*', 'tbl_state.title as state')
            ->where('tbl_district.status', '!=', 3)
            ->orderBy('tbl_district.id', 'desc')
            ->get();
        // $get_district = District::where('status', '!=', 3)->orderBy('id', 'desc')->get();
        $get_state = State::where('status', 1)->orderBy('id', 'desc')->get();
        return view('district.index', compact('title', 'get_district','get_state'));
    }

    public function store_district(Request $request)
    {

        if ($request->hidden_id) {
            $check_data = $this->check_exist_data($request->title, $request->hidden_id);
            if ($check_data) {
                return redirect()->route('district')->with('error', 'District  already exists.');
            }
            $district = District::findOrFail($request->hidden_id);
            $request->validate([
                'title' => 'required',
                'status' => 'required',
                'state_id' => 'required',
            ]);

            $district->title = $request->title;
            $district->state_id = $request->state_id;
            $district->status = $request->status;
            $district->update();
            return redirect()->route('district')->with('success', 'District  updated successfully.');
        }
        $check_data =  $this->check_exist_data($request->title, null);
        if ($check_data) {
            return redirect()->route('district')->with('error', 'District  already exists.');
        }
        $request->validate([
            'status' => 'required',
            'title' => 'required',
            'state_id' => 'required',
        ]);
        $district = new District();
        $district->title = $request->title;
        $district->state_id = $request->state_id;
        $district->status = $request->status;
        $district->save();
        return redirect()->route('district')->with('success', 'District  created successfully.');
    }

    public function edit_district($id)
    {
        $title = 'Edit District ';
        $find_district = District::find($id);
        $get_district = DB::table('tbl_district')
            ->join('tbl_state', 'tbl_district.state_id', '=', 'tbl_state.id')
            ->select('tbl_district.*', 'tbl_state.title as state')
            ->where('tbl_district.status', '!=', 3)
            ->orderBy('tbl_district.id', 'desc')
            ->get();
        // $get_district = District::where('status', '!=', 3)->orderBy('id', 'desc')->get();
        $get_state = State::where('status', 1)->orderBy('id', 'desc')->get();

        return view('district.index', compact('title', 'get_district', 'find_district','get_state'));
    }

    public function destroy_district($id)
    {

        $district = District::findOrFail($id);
        $district->status = 3;
        $district->update();
        return redirect()->route('district')->with('success', 'District  deleted successfully.');
    }

    public function check_exist_data($title, $id)
    {
        if ($id != null && $title != null) {
            $check_district = District::where('title', $title)->where('status', '!=', 3)->where('id','!=',$id)->first();
            if ($check_district) {
                return true;
            }
        } else {
            $check_district = District::where('title', $title)->where('status', '!=', 3)->first();
            if ($check_district) {
                return true;
            }
        }
    }





}
