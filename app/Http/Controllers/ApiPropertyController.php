<?php

namespace App\Http\Controllers;

use App\Models\CategoriesModal;
use App\Models\Facilities;
use Illuminate\Http\Request;
use App\Models\Property;
use App\Models\Vehicle;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class ApiPropertyController extends Controller
{
   public function index(Request $request)
{
    try {
        $statusFilter = $request->input('status', 1);
        $userStatusFilter = $request->input('user_status', 1);
        $sortBy = $request->input('sort_by', 'a.created_at');
        $sortOrder = $request->input('sort_order', 'desc');
        $get_vehicle = DB::table('vehicles as a')
            ->join('users as b', 'a.user_id', '=', 'b.id')
            ->select('a.*', 'b.name as user_name')
            ->where('a.status', $statusFilter)
            ->where('b.status', $userStatusFilter)->where('a.user_id',$request->user->id)
            ->orderBy($sortBy, $sortOrder)
            ->get();
        return response()->json([
            'status' => 'OK',
            'data' => $get_vehicle,
        ], 200);
    } catch (\Exception $e) {
        return response()->json([
            'status' => 'Error',
            'message' => 'An error occurred while fetching vehicles.',
            'error' => $e->getMessage(),
        ], 500);
    }
}

public function vehicle_captain(Request $request){
    $get_user = $request->user->role_id;
    if($get_user==3){
        return response()->json([
            'status' => 'Error',
            'message' => 'Only Allowed Captain.'
        ], 401);
    }
    $get_vehicle = Vehicle::where('status',1)->get();
    return response()->json([
        'status' => 'OK',
        'data' => $get_vehicle,
    ], 200);
}

public function delete_user(Request $request){
    $get_user = $request->user->id;
    DB::table('users')->where('id',$get_user)->delete();
    return response()->json([
        'status'=> 'OK',
        'messaage'=> 'User Deleted Successfully !'
    ]);
}


    public function create(Request $request)
    {

        if ($request->method() == 'POST') {
            $validatedData = $request->validate([
                'vehicle_type' => 'required',
                'vehicle_number' => 'required'
            ]);
            $checkData = Property::where('vehicle_number', $request->vehicle_number)->first();
            $property_exist = Property::where('user_id', $request->user->id)->first();
            if ($checkData) {
                 return response()->json(['status'=>'error','message'=>'Vehicle Number Already Exist'],300);
            }
            $hotel = new Property();
            $hotel->user_id = $request->user->id;
            $hotel->vehicle_type = $request->vehicle_type;
            $hotel->vehicle_number = $request->vehicle_number;
            if(!$property_exist){
             $hotel->is_vehicle_default = 1;
            }
            $hotel->save();
            return response()->json(['status'=>'OK','message'=>'Vehicle Added Successfully'],200);
        }

    }


    public function edit(Request $request , $id)
    {
        try {
        $statusFilter = $request->input('status', 1);
        $userStatusFilter = $request->input('user_status', 1);
        $sortBy = $request->input('sort_by', 'a.created_at');
        $sortOrder = $request->input('sort_order', 'desc');
        $get_vehicle = DB::table('vehicles as a')
            ->join('users as b', 'a.user_id', '=', 'b.id')
            ->select('a.*', 'b.name as user_name')
            ->where('a.status', $statusFilter)->where('a.id',$id)
            ->where('b.status', $userStatusFilter)
            ->orderBy($sortBy, $sortOrder)
            ->get();
        return response()->json([
            'status' => 'OK',
            'data' => $get_vehicle,
        ], 200);
    } catch (\Exception $e) {
        return response()->json([
            'status' => 'Error',
            'message' => 'An error occurred while fetching vehicles.',
            'error' => $e->getMessage(),
        ], 500);
    }
    }

    public function update(Request $request)
    {
           if ($request->method() == 'POST') {
            // $validatedData = $request->validate([
            //     'vehicle_type' => 'required',
            //     'vehicle_number' => 'required'
            // ]);
            $checkData = Property::where('vehicle_number', $request->vehicle_number)->where('id','!=',$request->hidden_id)->where('user_id',$request->user->id)->first();
            if ($checkData) {
                 return response()->json(['status'=>'error','message'=>'Vehicle Number Already Exist'],300);
            }
            $hotel = Property::find($request->hidden_id);
            if($request->is_vehicle_default){
                Property::where('user_id',$request->user->id)->where('id','!=',$request->hidden_id)->update(['is_vehicle_default'=>"2"]);
               $hotel->is_vehicle_default = $request->is_vehicle_default;
            }
            if($request->vehicle_type){
             $hotel->vehicle_type = $request->vehicle_type;
            }
             if($request->vehicle_number){

            $hotel->vehicle_number = $request->vehicle_number;
             }
            $hotel->save();
            return response()->json(['status'=>'OK','message'=>'Vehicle Update Successfully'],200);
        }
    }


    public function destroy(Request $request , $id)
    {
        try {
            $property = Property::where('id',$id)->update(['status'=>3]);

             return response()->json(['status'=>'OK','message'=>'Vehicle Delete Successfully'],200);
        } catch (\Exception $e) {
            // Handle any exceptions
            return response()->json(['status'=>'error','message'=>'An error occurred while deleting the vehicle.'],300);
        }
    }


    public function check_exist_data($request, $id)
    {
        $query = Property::where('status', '!=', 3);
        if ($id !== null) {
            $query->where('id', '!=', $id);
        }
        $check_property = $query->where(function ($q) use ($request) {
            $q->where('title', $request->title);
        })->first();

        return $check_property;
    }

    public function delete_image(Request $request)
    {
        $image = DB::table('properties_images')->where('id', $request->id)->update(['status' => 3]);
        if ($image) {
            // if ($image->image) {
            //     Storage::disk('public')->delete($image->image);
            // }
            // $image->delete();
            echo 1;
            die;

            return response()->json(['success' => 'Image deleted successfully.']);
        } else {
            return response()->json(['error' => 'Image not found.']);
        }
    }
}
