<?php

namespace App\Http\Controllers;

use App\Models\Member;
use App\Models\State;
use DB;
use Faker\Provider\ar_EG\Company;
use Illuminate\Http\Request;
use PDO;

class StateController extends Controller
{

    public function index()
    {
        $title = 'State';
        $get_state = State::where('status', '!=', 3)->orderBy('id', 'desc')->get();
        return view('state.index', compact('title', 'get_state'));
    }

    public function store_state(Request $request)
    {

        if ($request->hidden_id) {
            $check_data = $this->check_exist_data($request->title, $request->hidden_id);
            if ($check_data) {
                return redirect()->route('state')->with('error', 'State  already exists.');
            }
            $state = State::findOrFail($request->hidden_id);
            $request->validate([
                'title' => 'required',
                'status' => 'required'
            ]);

            $state->title = $request->title;
            $state->status = $request->status;
            $state->update();
            return redirect()->route('state')->with('success', 'State  updated successfully.');
        }
        $check_data =  $this->check_exist_data($request->title, null);
        if ($check_data) {
            return redirect()->route('state')->with('error', 'State  already exists.');
        }
        $request->validate([
            'status' => 'required',
            'title' => 'required',
        ]);
        $state = new State();
        $state->title = $request->title;
        $state->status = $request->status;
        $state->save();
        return redirect()->route('state')->with('success', 'State  created successfully.');
    }

    public function edit_state($id)
    {
        $title = 'Edit State ';
        $find_state = State::find($id);
        $get_state = State::where('status', '!=', 3)->orderBy('id', 'desc')->get();
        return view('state.index', compact('title', 'get_state', 'find_state'));
    }

    public function destroy_state($id)
    {

        $state = State::findOrFail($id);
        $state->status = 3;
        $state->update();
        return redirect()->route('state')->with('success', 'State  deleted successfully.');
    }

    public function check_exist_data($title, $id)
    {
        if ($id != null && $title != null) {
            $check_state = State::where('title', $title)->where('status', '!=', 3)->first();
            if ($check_state) {
                return true;
            }
        } else {
            $check_state = State::where('title', $title)->where('status', '!=', 3)->first();
            if ($check_state) {
                return true;
            }
        }
    }





}
