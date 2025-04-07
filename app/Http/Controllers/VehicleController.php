<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Vehicle;
use Illuminate\Support\Facades\Storage;

class VehicleController extends Controller
{
    public function index()
    {
        $title = "Vehicle List";
        $allvehicle = Vehicle::where('status', '!=', '3')->orderBy('id', 'desc')->get();
        return view('vehicle.index', compact('title', 'allvehicle'));
    }

    public function create(Request $request)
    {
        if ($request->method() == 'POST') {
            $request->validate([
                'title' => 'required',
                'status' => 'required',
                'kilo_meter' => 'required|numeric',
                'extra_charges' => 'nullable|numeric',
                'seater' => 'required|numeric',
                'image' => 'required'
            ]);
            $check_data = $this->check_exist_data($request, null);
            if ($check_data) {
                $message = '';
                if ($check_data->title == $request->title) {
                    $message .= "Vehicle ";
                }
                if ($message) {
                    return redirect()->route('vehicle')
                        ->with('error', trim($message) . ' Already Exists');
                }
            }
            $vehicle = new Vehicle();
            $vehicle->title = $request->title;
            $vehicle->seater = $request->seater;
            $vehicle->status = $request->status;
            $vehicle->kilo_meter = $request->kilo_meter;
            $vehicle->extra_charges = $request->extra_charges;
            if ($request->hasFile('image')) {
                $file = $request->file('image');
                $filePath = $file->store('vehicle', 'public');
                $vehicle->image = $filePath;
            }
            $vehicle->save();
            return redirect()->route('vehicle')->with('success', 'Vehicle Added Successfully');
        }
    }

    public function edit($id)
    {
        $title = "Edit Vehicle";
        $get_vehicle = Vehicle::where('status', '!=', 3)->where('id', $id)->first();
        $allvehicle = Vehicle::where('status', '!=', '3')->orderBy('id', 'desc')->get();
        return view('vehicle.index', compact('title', 'allvehicle','get_vehicle'));
    }

    public function update(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'status' => 'required',
            'kilo_meter' => 'required|numeric',
            'seater' => 'required|numeric',
            'extra_charges' => 'nullable|numeric'
        ]);
        $check_data = $this->check_exist_data($request, $request->hidden_id);
        if ($check_data) {
            $message = '';
            if ($check_data->title == $request->title) {
                $message .= "Vehicle ";
            }
            if ($message) {
                return redirect()->route('vehicle.edit', ['id' => $request->hidden_id])
                    ->with('error', trim($message) . ' Already Exists');
            }
        }
        $vehicle = Vehicle::findOrFail($request->hidden_id);
        $vehicle->title = $request->title;
        $vehicle->seater = $request->seater;
        $vehicle->kilo_meter = $request->kilo_meter;
        $vehicle->extra_charges = $request->extra_charges;
        $vehicle->status = $request->status;
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filePath = $file->store('vehicle', 'public');
            $vehicle->image = $filePath;
        }
        $vehicle->updated_at = date('Y-m-d H:i:s');
        $vehicle->save();
        return redirect()->route('vehicle')->with('success', 'Vehicle Updated Successfully');
    }


    public function destroy($id)
    {
        $vehicle = Vehicle::findOrFail($id);
        $vehicle->status = 3;
        $vehicle->update();
        return redirect()->route('vehicle')->with('success', 'Vehicle deleted successfully.');
    }

    public function check_exist_data($request, $id)
    {
        $query = Vehicle::where('status', '!=', 3);
        if ($id !== null) {
            $query->where('id', '!=', $id);
        }
        $check_vehicle = $query->where(function ($q) use ($request) {
            $q->where('title', $request->title);
        })->first();

        return $check_vehicle;
    }
}
