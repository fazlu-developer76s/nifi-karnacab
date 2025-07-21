<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Http;
use App\Models\Banner;
use PDF;
use App\Models\Blog;
use App\Models\CategoriesModal;
use App\Models\CmsModal;
use App\Models\Kycprocess;
use App\Models\Package;
use App\Models\PetCategory;
use App\Models\Service;
use App\Models\Testimonal;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use App\Mail\Enquirys;
use App\Models\Booking;
use App\Models\City;
use App\Models\Enquiry;
use App\Models\Gallary;
use App\Models\Page;
use App\Models\Pincode;
use App\Models\Property;
use App\Models\PropertyReview;
use App\Models\Seo;
use App\Models\State;
use App\Helpers\Global_helper;
use App\Models\Vehicle;
use Illuminate\Support\Facades\Mail;
use Svg\Tag\Rect;
use Kreait\Firebase\Factory;
use Kreait\Firebase\Messaging\CloudMessage;
use Kreait\Firebase\Messaging\Notification;

class ApiController extends Controller
{

    public function get_state(Request $request)
    {
        $get_state = State::where('status', 1)->get();
        if ($get_state) {
            return response()->json([
                'status' => 'OK',
                'message' => 'State Fetched Successfully',
                'data' => $get_state
            ], 200);
        } else {
            return response()->json([
                'status' => 'error',
                'meesage' => 'data not found'
            ], 401);
        }
    }
    
    public function get_district(Request $request, $id){
      $get_district = DB::table('tbl_district')->where('status', 1)->where('state_id',$id)->get();
        if ($get_district) {
            return response()->json([
                'status' => 'OK',
                'message' => 'District Fetched Successfully',
                'data' => $get_district
            ], 200);
        } else {
            return response()->json([
                'status' => 'error',
                'meesage' => 'data not found'
            ], 401);
        }  
    }

    public function get_city(Request $request, $state_id)
    {
        $get_city = City::where('status', 1)->where('state_id', $state_id)->get();
        if ($get_city) {
            return response()->json([
                'status' => 'OK',
                'message' => 'City Fetched Successfully',
                'data' => $get_city
            ], 200);
        } else {
            return response()->json([
                'status' => 'error',
                'message' => 'City not found'
            ], 401);
        }
    }

    public function uploadImage(Request $request)
    {
        // Validate the uploaded file
        $request->validate([
            'image' => 'required|image|max:2048',
        ]);

        // Store the image in the 'public/images' directory
        $path = $request->file('image')->store('images', 'public');

        // Generate the full URL to the image
        $url = asset('storage/' . $path);

        return response()->json([
            'success' => true,
            'url' => $url,
        ]);
    }

    public function add_address(Request $request)
    {

        $rules = [
            'type'               => 'required|string',
            'complete_address'      => 'required|string',
        ];
        $validate = \Myhelper::FormValidator($rules, $request);
        if ($validate != "no") {
            return $validate;
        }
        $inserted = DB::table('tbl_address')->insert([
            'user_id'               => $request->user->id,
            'type'               => $request->type,
            'complete_address'      => $request->complete_address
        ]);
        if ($inserted) {
            return response()->json(['status' => 'OK', 'message' => 'Address added successfully.'], 200);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'Failed to add address.'], 500);
        }
    }

    public function update_address(Request $request, $id)
    {
        $rules = [
            'type'               => 'required|string',
            'complete_address'      => 'required|string',
        ];
        $validate = \Myhelper::FormValidator($rules, $request);
        if ($validate != "no") {
            return $validate;
        }
        $inserted = DB::table('tbl_address')->where('id', $id)->update([
            'type'               => $request->type,
            'complete_address'      => $request->complete_address
        ]);
        return response()->json(['status' => 'OK', 'message' => 'Address update successfully.'], 200);
    }

    public function get_address(Request $request)
    {
        $addresses = DB::table('tbl_address')->where('status', 1)->where('user_id', $request->user->id)->get();
        return response()->json(['status' => 'OK', 'data' => $addresses], 200);
    }

    public function delete_address(Request $request, $id)
    {
        $deleted = DB::table('tbl_address')->where('id', $id)->delete();

        if ($deleted) {
            return response()->json(['status' => 'OK', 'message' => 'Address deleted successfully.'], 200);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'Failed to delete address.'], 500);
        }
    }

    public function get_pages(Request $request, $title)
    {
        $page = Page::where('page_name', $title)->first();
        if ($page) {
            return response()->json(['status' => 'OK', 'data' => $page], 200);
        } else {
            return response()->json(['status' => 'Error', 'data' => 'Page not found.'], 404);
        }
    }

    public function get_pages_all(Request $request)
    {
        $page = Page::get();
        if ($page) {
            return response()->json(['status' => 'OK', 'data' => $page], 200);
        } else {
            return response()->json(['status' => 'Error', 'data' => 'Page not found.'], 404);
        }
    }



    public function get_vehicle(Request $request)
    {
        $get_vehicle = Vehicle::where('status', 1)->get();
        if ($get_vehicle) {
            return response()->json([
                'status' => 'OK',
                'message' => 'Vehicle Fetched Successfully',
                'data' => $get_vehicle
            ], 200);
        } else {
            return response()->json([
                'status' => 'error',
                'message' => 'Vehicle not found'
            ], 401);
        }
    }

    public function getAddressCoordinate($address)
    {
        $apiKey = getenv('GOOGLE_MAPS_API');
        $url = "https://maps.googleapis.com/maps/api/geocode/json?address=" . urlencode($address) . "&key=" . $apiKey;

        $response = file_get_contents($url);
        $data = json_decode($response, true);

        if ($data['status'] === 'OK') {
            $location = $data['results'][0]['geometry']['location'];
            return [
                'ltd' => $location['lat'],
                'lng' => $location['lng']
            ];
        } else {
            throw new Exception('Unable to fetch coordinates');
        }
    }

    public function get_suggestion(Request $request)
    {
        $request->validate([
            'search' => 'required|string|max:255',
        ]);
        $apiKey = env('GOOGLE_MAPS_API');
        $input = urlencode($request->search);
        $url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input={$input}&key={$apiKey}";
        try {
            $response = file_get_contents($url);
            if ($response === false) {
                throw new \Exception('Failed to fetch data from Google API.');
            }
            $data = json_decode($response, true);
            if (isset($data['status']) && $data['status'] === 'OK') {
                return response()->json([
                    'status' => 'success',
                    'suggestions' => array_filter(array_column($data['predictions'], 'description')),
                ], 200);
            } else {
                return response()->json([
                    'status' => 'error',
                    'message' => $data['error_message'] ?? 'Unable to fetch suggestions',
                ], 500);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Something went wrong: ' . $e->getMessage(),
            ], 500);
        }
    }




    public function get_booking_vehicle(Request $request)
    {

        $rules = [
            'current_address'  => 'required',
            'drop_address'     => 'required',
        ];
        $validate = \Myhelper::FormValidator($rules, $request);
        if ($validate !== "no") {
            return response()->json(['status' => false, 'errors' => $validate], 422);
        }
        $apiKey = env('GOOGLE_MAPS_API');
        $get_radius = Global_helper::companyDetails()->radius;
        // Step 1: Get current  location lat/lng from drop_address
        $geocodeResponse = Http::get("https://maps.googleapis.com/maps/api/geocode/json", [
            'address' => $request->current_address,
            'key'     => $apiKey
        ]);
        $geocodeData = $geocodeResponse->json();
        if (empty($geocodeData['results'][0])) {
            return response()->json(['status' => false, 'message' => 'Invalid drop address'], 400);
        }
        $getCurrent = $geocodeData['results'][0]['geometry']['location'];
        // Step 2: Get Vehcile within radius
        $captains = $this->getCaptainsInRadius(
            $getCurrent['lat'],
            $getCurrent['lng'],
            $get_radius,
            $request->vehicle_type
        );
        // Step 3: Get drop location lat/lng from drop_address
        $geocodeResponse = Http::get("https://maps.googleapis.com/maps/api/geocode/json", [
            'address' => $request->drop_address,
            'key'     => $apiKey
        ]);
        $geocodeData = $geocodeResponse->json();
        if (empty($geocodeData['results'][0])) {
            return response()->json(['status' => false, 'message' => 'Invalid drop address'], 400);
        }
        $dropLocation = $geocodeData['results'][0]['geometry']['location'];

        // check if the drop address is in the same state as the current address
        $dropAddressUrl = "https://maps.googleapis.com/maps/api/geocode/json?address=" . urlencode($request->drop_address) . "&key=" . $apiKey;
        $dropResponse = Http::get($dropAddressUrl);
        $dropData = $dropResponse->json();
        if (empty($dropData['results'][0])) {
            return response()->json(['status' => false, 'message' => 'Invalid drop address'], 400);
        }
        $dropState = null;

        foreach ($dropData['results'][0]['address_components'] as $component) {
            if (in_array('administrative_area_level_1', $component['types'])) {
                $dropState = $component['long_name'];
                break;
            }
        }
        if (!$dropState) {
            return response()->json(['status' => false, 'message' => 'Unable to extract state from drop address'], 400);
        }
        $checkState = DB::table('tbl_state')->where('title', $dropState)->first();
        if (!$checkState) {
            return response()->json(['status' => false, 'message' => 'Drop address is outside serviceable states'], 400);
        }

        // Step 4: Get trip distance/duration from current to drop
        $distanceMatrixResponse = Http::get("https://maps.googleapis.com/maps/api/distancematrix/json", [
            'origins'      => $request->current_address,
            'destinations' => $request->drop_address,
            'key'          => $apiKey
        ]);
        $matrixData = $distanceMatrixResponse->json();
        if (
            $matrixData['status'] !== 'OK' ||
            $matrixData['rows'][0]['elements'][0]['status'] === 'ZERO_RESULTS'
        ) {
            return response()->json(['status' => false, 'message' => 'Could not calculate route distance.'], 400);
        }
        $tripDuration = $matrixData['rows'][0]['elements'][0];

        // Step 5: Loop through vehcile and calculate distance from source
        $captainList = [];
        foreach ($captains as $captain) {
            $tripDistanceInKm = 0;
            if (isset($tripDuration['distance']['text'])) {
                $distanceText = $tripDuration['distance']['text']; // e.g., "12.4 km"
                $tripDistanceInKm = floatval(str_replace(['km', 'Kms', 'KM', ','], '', $distanceText));
            }

            $kiloRate = $captain->kilo_meter ?? 0;
            $extraCharges = $captain->extra_charges ?? 0;
            $totalFare = ($tripDistanceInKm * $kiloRate) + ($tripDistanceInKm * $extraCharges);
            
                $get_discount_amount = $totalFare * (Global_helper::companyDetails()->discount / 100);
                $discount_fare = $totalFare + $get_discount_amount;
        
            $captain->kilo_meter_details = [
                'trip_distance_km' => $tripDistanceInKm,
                'rate_per_km'      => $kiloRate,
                'extra_charges'    => $extraCharges,
                'calculated_fare'  => round($totalFare, 2),
                'discount_fare' => round($discount_fare, 0)
            ];
            $captainList[] = [
                'vehicle_info'         => $captain,
                'trip_to_drop'         => $tripDuration,
                'destination_lat_lng'  => $dropLocation,
                'current_lat_lng'      => $getCurrent
            ];
            // dd($captainList);
        }

        return response()->json([
            'status'  => 'OK',
            'message' => 'Nearby vehicle fetched successfully',
            'data'    => $captainList
        ]);
    }


    public function get_single_booking_vehicle(Request $request, $id)
    {
        $apiKey = env('GOOGLE_MAPS_API');
        $get_radius = Global_helper::companyDetails()->radius;

        // Step 1: Get current location (lat/lng) from current_address
        $currentResponse = Http::get("https://maps.googleapis.com/maps/api/geocode/json", [
            'address' => $request->current_address,
            'key'     => $apiKey
        ]);

        $currentData = $currentResponse->json();
        if (empty($currentData['results'][0])) {
            return response()->json(['status' => false, 'message' => 'Invalid current address'], 400);
        }

        $getCurrent = $currentData['results'][0]['geometry']['location'];

        // Step 2: Get Captains/Vehicles within radius
        $captains = $this->getCaptainsInRadius(
            $getCurrent['lat'],
            $getCurrent['lng'],
            $get_radius,
            $id // vehicle_type passed here
        );

        if (empty($captains) || empty($captains[0]->captain)) {
            return response()->json(['status' => false, 'message' => 'No nearby captains found'], 404);
        }

        // Step 3: Get drop location lat/lng from drop_address
        $dropResponse = Http::get("https://maps.googleapis.com/maps/api/geocode/json", [
            'address' => $request->drop_address,
            'key'     => $apiKey
        ]);

        $dropData = $dropResponse->json();
        if (empty($dropData['results'][0])) {
            return response()->json(['status' => false, 'message' => 'Invalid drop address'], 400);
        }

        $dropLocation = $dropData['results'][0]['geometry']['location'];

        // Step 4: Get trip distance/duration from current to drop
        $matrixResponse = Http::get("https://maps.googleapis.com/maps/api/distancematrix/json", [
            'origins'      => $request->current_address,
            'destinations' => $request->drop_address,
            'key'          => $apiKey
        ]);

        $matrixData = $matrixResponse->json();
        if (
            $matrixData['status'] !== 'OK' ||
            $matrixData['rows'][0]['elements'][0]['status'] === 'ZERO_RESULTS'
        ) {
            return response()->json(['status' => false, 'message' => 'Could not calculate route distance.'], 400);
        }

        $tripDuration = $matrixData['rows'][0]['elements'][0];

        // Step 5: Loop through captains and calculate distance from current location
        $captainList = [];
        foreach ($captains[0]->captain as $capt) {


            $distanceResponse = Http::get("https://maps.googleapis.com/maps/api/distancematrix/json", [
                'origins'      => "{$getCurrent['lat']},{$getCurrent['lng']}",
                'destinations' => "{$capt->lat},{$capt->long}",
                'key'          => $apiKey
            ]);

            $distData = $distanceResponse->json();
            if (
                empty($distData['rows'][0]['elements'][0]['status']) ||
                $distData['rows'][0]['elements'][0]['status'] !== 'OK'
            ) {
                continue; // skip if distance can't be calculated
            }

            $captainDistance = $distData['rows'][0]['elements'][0];

            // Step 6: Calculate fare
            $tripDistanceInKm = 0;
            if (isset($tripDuration['distance']['text'])) {
                $distanceText = $tripDuration['distance']['text']; // e.g., "12.4 km"
                $tripDistanceInKm = floatval(str_replace(['km', 'Kms', 'KM', ','], '', $distanceText));
            }

            $kiloRate = $captains[0]->kilo_meter ?? 0;
            $extraCharges = $captains[0]->extra_charges ?? 0;

            $totalFare = ($tripDistanceInKm * $kiloRate) + ($tripDistanceInKm * $extraCharges);

            // Step 7: Add data to list
            $captainList[] = [
                'captain_info'         => $capt,
                'vehicle_info'         => [
                    'vehicle_id'     => $captains[0]->id,
                    'vehicle_name'   => $captains[0]->title ?? '',
                    'vehicle_seater'   => $captains[0]->seater ?? '',
                    'vehicle_image'   => $captains[0]->image ?? '',
                    'rate_per_km'    => $kiloRate,
                    'extra_charges'  => $extraCharges
                ],
                'fare_details'         => [
                    'trip_distance_km' => $tripDistanceInKm,
                    'calculated_fare'  => round($totalFare, 2),
                ],
                'trip_to_drop'         => $tripDuration,
                'captain_distance'     => $captainDistance,
                'destination_lat_lng'  => $dropLocation,
                'current_lat_lng'      => $getCurrent,
            ];
        }

        return response()->json([
            'status'  => 'OK',
            'message' => 'Nearby vehicle fetched successfully',
            'data'    => $captainList
        ]);
    }






    public function getCaptainsInRadius($lat, $lng, $radius, $vehicle_type)
    {



        $get_vehicle_query = DB::table('tbl_vehicle')->where('status', 1);
        if ($vehicle_type) {
            $get_vehicle_query->where('id', $vehicle_type);
        }
        $get_vehicle = $get_vehicle_query->get();
        $new_data = [];
        foreach ($get_vehicle as $row) {
            $captains = DB::table('users')
                ->select('*', DB::raw("(6371 * acos(cos(radians($lat)) * cos(radians(lat)) * cos(radians(`long`) - radians($lng)) + sin(radians($lat)) * sin(radians(lat)))) AS distance"))
                // ->where('ride_vehicle_type', $vehicle_type)
                ->where('car_id', $row->id)
                ->where('role_id', 2)
                ->where('is_booking_active',2)
                ->having('distance', '<=', $radius)
                ->orderBy('distance', 'asc')
                ->get();
            $row->captain = $captains;
            $new_data[] = $row;
        }
        return $new_data;
    }


    public function create_booking(Request $request)
    {
        $rules = [
            // 'captain_id' => 'required|integer',
            // 'vehicle_id' => 'required|integer',
            'vehicle_title' => 'required|string|max:100',
            'vehicle_image' => 'required|string|max:255',
            'vehicle_kilo_meter' => 'required|string|max:50',
            'vehicle_extra_charges' => 'required|string|max:50',
            'vehicle_seater' => 'required|integer',
            'trip_distance_km' => 'required|numeric',
            'rate_per_km' => 'required|numeric',
            'calculated_fare' => 'required|numeric',
            // 'captain_distance_text' => 'required|string|max:50',
            // 'captain_duration_text' => 'required|string|max:50',
            'trip_distance_text' => 'required|string|max:50',
            // 'trip_distance_value' => 'required|integer',
            'trip_duration_text' => 'required|string|max:50',
            // 'trip_duration_value' => 'required|integer',
            'current_lat' => 'required|numeric',
            'current_lng' => 'required|numeric',
            'current_address' => 'required|string|max:255',
            'drop_lat' => 'required|numeric',
            'drop_lng' => 'required|numeric',
            'drop_address' => 'required|string|max:255'
        ];
        $validate = \Myhelper::FormValidator($rules, $request);
        if ($validate != "no") {
            return $validate;
        }
        $get_old_booking = DB::table('tbl_booking')->where('id',$request->user->id)->where('booking_status',1)->first();
        if($get_old_booking){
            $delete_last_booking = DB::table('tbl_booking')->where('id',$get_old_booking->id)->delete();
        }
        $booking = new Booking();
        $booking->user_id = $request->user->id;
        $booking->captain_id = $request->captain_id;
        $booking->vehicle_id = $request->vehicle_id;
        $booking->vehicle_title = $request->vehicle_title;
        $booking->vehicle_image = $request->vehicle_image;
        $booking->vehicle_kilo_meter = $request->vehicle_kilo_meter;
        $booking->vehicle_extra_charges = $request->vehicle_extra_charges;
        $booking->vehicle_seater = $request->vehicle_seater;
        $booking->trip_distance_km = $request->trip_distance_km;
        $booking->rate_per_km = $request->rate_per_km;
        $booking->calculated_fare = $request->calculated_fare;
        $get_discount_amount = $request->calculated_fare * (Global_helper::companyDetails()->discount / 100);

        $booking->discount = $request->calculated_fare + $get_discount_amount;


        $booking->captain_distance_text = $request->captain_distance_text;
        $booking->captain_duration_text = $request->captain_duration_text;
        $booking->trip_distance_text = $request->trip_distance_text;
        $booking->trip_distance_value = $request->trip_distance_value;
        $booking->trip_duration_text = $request->trip_duration_text;
        $booking->trip_duration_value = $request->trip_duration_value;
        $booking->current_lat = $request->current_lat;
        $booking->current_lng = $request->current_lng;
        $booking->current_address = $request->current_address;
        $booking->drop_lat = $request->drop_lat;
        $booking->drop_lng = $request->drop_lng;
        $booking->drop_address = $request->drop_address;
        $booking->otp = rand(1000, 9999);
        $booking->save(); // Save to DB
        $get_data = $this->get_single_booking_vehicle($request, $request->vehicle_id);
        $responseData = $get_data->getData();
        $new_data = $responseData->data;

        Global_helper::SaveNotification($booking->id, $request->user->id,  'New Booking', 'New Booking Created');
        foreach ($new_data as $row) {

        $this->sendNotificationToUser($row->captain_info->fcm_token,'New Booking', "New Booking Found");
                DB::table('tbl_notification')->insert([
                'booking_id' => $booking->id,
                'user_id' => $row->captain_info->id,

                'subject' => 'New Booking',
                'description' => 'New booking found '
            ]);


            DB::table('tbl_booking_log')->insert([
                'captain_id' => $row->captain_info->id,
                'booking_id' => $booking->id,
                'user_id'    => $request->user->id,
                'booking_type' => 1,
            ]);
        }
        return response()->json(['status' => 'OK', 'message' => 'Booking created successfully', 'data' => $booking], 200);
    }


    public function fetch_booking(Request $request)
    {
        $get_user = DB::table('users')->where('id', $request->user->id)->first();
        if ($get_user->is_user_verified == 'non-verified') {
            return response()->json(['status' => 'Error', 'message' => 'Please verify your account first'], 401);
        }
        $get_booking_log = DB::table('tbl_booking_log')->where('captain_id', $request->user->id)->where('booking_type', 1)->where('status', 1)->get();
        $new_data = [];
        foreach ($get_booking_log as $row) {
            $get_booking = DB::table('tbl_booking')->where('id', $row->booking_id)->first();
            $row->booking = $get_booking;
            $new_data[] = $row;
        }
        // dd($get_booking_log);
        // $get_booking_log = DB::table('tbl_booking_log as a')->leftJoin('tbl_booking as b','a.booking_id','=','b.id')->select('b.*','a.booking_type as  booking_status_tbl_log')->where('a.captain_id', $request->user->id)->where('a.booking_type', 1)->get();
        return response()->json(['status' => 'OK', 'message' => 'Booking fetched successfully', 'data' => $new_data], 200);
    }

    public function fetch_notification(Request $request){
        $get_notification = DB::table('tbl_notification')->where('user_id',$request->user->id)->orderBy('id','desc')->get();
        if ($get_notification) {
            return response()->json(['status' => 'OK', 'message' => 'Notification fetched successfully', 'data' => $get_notification], 200);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'No notification found'], 404);
        }
    }


    public function fetch_booking_user(Request $request, $id)
    {
        $get_booking = DB::table('tbl_booking')->where('id', $id)->first();

        if ($get_booking->booking_status == 2 || $get_booking->booking_status == 4 || $get_booking->booking_status == 3) {
            $get_booking->captain_info = DB::table('users')->where('id', $get_booking->captain_id)->first();
        }
        if ($get_booking) {
            return response()->json(['status' => 'OK', 'message' => 'Booking fetched successfully', 'data' => $get_booking], 200);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'Booking not found'], 404);
        }
    }

    public function fetch_booking_user_single(Request $request)
    {
        // Fetch booking with status 2 or 3
        $booking = DB::table('tbl_booking')
            ->select('id', 'vehicle_title', 'vehicle_image', 'user_id', 'captain_id', 'current_address as pick_up_location', 'booking_status', 'otp', 'calculated_fare','current_lat','current_lng')
            ->whereIn('booking_status', [2,3,4,5]);
            
        if($request->user->role_id == 2 ){
            $booking->where('captain_id',$request->user->id);
        }
        if($request->user->role_id == 3){
         
            $booking->where('user_id',$request->user->id);
        }
        $get_booking = $booking->orderBy('id','desc')->first();

        if (!$get_booking) {
            return response()->json([
                'status' => 'Error',
                'message' => 'Booking not found',
            ], 404);
        }
     ;
        // Attach user or captain info based on role
        if ($request->user->role_id == 2) {
            // Role: Captain
            $user = DB::table('users')->where('id', $get_booking->user_id)->select('name', 'mobile_no', 'image')->first();
            $captain = DB::table('users')->where('id', $get_booking->captain_id)->select('current_address','vehicle_number')->first();

            $get_booking->user_info = $user;
            $get_booking->captain_info = $captain;
            // Get current addresses
            $originAddress = $captain->current_address ?? null;
            $destinationAddress = $get_booking->pick_up_location ?? null;
        } else {
            // Role: User

            $captain = DB::table('users')->where('id', $get_booking->captain_id)->select('name', 'mobile_no', 'image', 'current_address','vehicle_number')->first();
            $get_booking->captain_info = $captain;
            $originAddress = $captain->current_address ?? null;
            $destinationAddress = $get_booking->pick_up_location ?? null;
        }



        if ($originAddress && $destinationAddress) {
            $apiKey = env('GOOGLE_MAPS_API');

            $matrixResponse = Http::get('https://maps.googleapis.com/maps/api/distancematrix/json', [
                'origins'      => $originAddress,
                'destinations' => $destinationAddress,
                'key'          => $apiKey,
            ]);

            $matrixData = $matrixResponse->json();

            if (
                $matrixData['status'] === 'OK' &&
                isset($matrixData['rows'][0]['elements'][0]) &&
                $matrixData['rows'][0]['elements'][0]['status'] === 'OK'
            ) {
                $tripElement = $matrixData['rows'][0]['elements'][0];

                $get_booking->user_duration_text  = $tripElement['duration']['text'] ?? '';
                $get_booking->user_distance_text  = $tripElement['distance']['text'] ?? '';
                $get_booking->user_distance_value = $tripElement['distance']['value'] ?? 0; // meters
            } else {
                $get_booking->user_duration_text  = '';
                $get_booking->user_distance_text  = '';
                $get_booking->user_distance_value = 0;
            }
        }

        return response()->json([
            'status' => 'OK',
            'message' => 'Booking fetched successfully',
            'data' => $get_booking,
        ], 200);
    }
    public function activate_booking_get(Request $request)
    {
        // Fetch booking with status 2 or 3
        $get_booking = DB::table('tbl_booking')
            ->where('booking_status', 3)
            ->first();

        if (!$get_booking) {
            return response()->json([
                'status' => 'Error',
                'message' => 'Booking not found',
            ], 404);
        }

        // Attach user or captain info based on role
        if ($request->user->role_id == 2) {
            // Role: Captain
            $user = DB::table('users')->where('id', $get_booking->user_id)->select('name', 'mobile_no', 'image')->first();
            $captain = DB::table('users')->where('id', $get_booking->captain_id)->select('current_address')->first();

            $get_booking->user_info = $user;
            $get_booking->captain_info = $captain;
            // Get current addresses
            $originAddress = $captain->current_address ?? null;
            $destinationAddress = $get_booking->current_address ?? null;
        } else {
            // Role: User

            $captain = DB::table('users')->where('id', $get_booking->captain_id)->select('name', 'mobile_no', 'image', 'current_address')->first();
            $get_booking->captain_info = $captain;
            $originAddress = $captain->current_address ?? null;
            $destinationAddress = $get_booking->current_address ?? null;
        }



        if ($originAddress && $destinationAddress) {
            $apiKey = env('GOOGLE_MAPS_API');

            $matrixResponse = Http::get('https://maps.googleapis.com/maps/api/distancematrix/json', [
                'origins'      => $originAddress,
                'destinations' => $destinationAddress,
                'key'          => $apiKey,
            ]);

            $matrixData = $matrixResponse->json();

            if (
                $matrixData['status'] === 'OK' &&
                isset($matrixData['rows'][0]['elements'][0]) &&
                $matrixData['rows'][0]['elements'][0]['status'] === 'OK'
            ) {
                $tripElement = $matrixData['rows'][0]['elements'][0];

                $get_booking->user_duration_text  = $tripElement['duration']['text'] ?? '';
                $get_booking->user_distance_text  = $tripElement['distance']['text'] ?? '';
                $get_booking->user_distance_value = $tripElement['distance']['value'] ?? 0; // meters
            } else {
                $get_booking->user_duration_text  = '';
                $get_booking->user_distance_text  = '';
                $get_booking->user_distance_value = 0;
            }
        }

        return response()->json([
            'status' => 'OK',
            'message' => 'Booking fetched successfully',
            'data' => $get_booking,
        ], 200);
    }


    public function activate_booking(Request $request, $id)
    {

        $get_booking = DB::table('tbl_booking')->where('id', $id)->where('captain_id', $request->user->id)->where('otp', $request->otp)->first();
        if (!$get_booking) {
            return response()->json(['status' => 'Error', 'message' => 'Invalid OTP'], 401);
        }
        $get_user = DB::table('users')->where('id', $get_booking->user_id)->first();
        $get_captain = DB::table('users')->where('id', $get_booking->captain_id)->first();
        if ($get_booking->booking_status == 2) {
            DB::table('tbl_booking')->where('id', $id)->update(['booking_status' => 3]);
            DB::table('tbl_booking_log')->where('captain_id', $request->user->id)->where('booking_id', $id)->update(['status' => 2]);
            DB::table('tbl_booking_log')->insert(['captain_id' => $request->user->id, 'booking_id' => $id, 'user_id' => $get_booking->user_id, 'booking_type' => 3]);

            Global_helper::SaveNotification($id,$get_user->id,'Booking Activated','Your booking has been activated by ' . $get_captain->name);
            Global_helper::SaveNotification($id,$get_captain->id,'Booking Activated','You have activated the booking of ' . $get_user->name);
            $this->sendNotificationToUser($get_user->fcm_token,'Booking Activated','Your booking has been activated by ' . $get_captain->name);
            $captain_active = DB::table('users')->where('id',$request->user->id)->update(['is_booking_active'=>1]);
            return response()->json(['status' => 'OK', 'message' => 'Booking activated successfully'], 200);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'Booking not found'], 404);
        }
    }

    public function update_booking_status(Request $request, $id)
    {

        $get_booking = Booking::where('id', $id)->first();
        $get_user = DB::table('users')->where('id', $get_booking->user_id)->first();
        $get_captain = DB::table('users')->where('id', $get_booking->captain_id)->first();
        // accept booking for captain
        if ($request->booking_status == 2) {

            $check_book = Booking::where('user_id', $request->user->id)->where('booking_status', 2)->orWhere('booking_status', 3)->first();
            if ($check_book) {
                return response()->json([
                    'status' => false,
                    'message' => 'You have already accepted a booking. Please complete or cancel this booking before accepting another.',
                ]);
            }
            $get_booking = Booking::where('id', $id)->first();
            if ($get_booking->booking_status != 1) {
                return response()->json(['status' => 'Error', 'message' => 'Booking status is not accepted'], 401);
            }
            DB::table('tbl_booking')->where('id', $id)->update(['booking_status' => 2, 'captain_id' => $request->user->id]);
            DB::table('tbl_booking_log')->where('captain_id', $request->user->id)->where('booking_id', $id)->update(['status' => 2]);
            DB::table('tbl_booking_log')->insert(['captain_id' => $request->user->id, 'booking_id' => $id, 'user_id' => $get_booking->user_id, 'booking_type' => 2]);

            $get_captain = DB::table('users')->where('id', $request->user->id)->first();
            Global_helper::SaveNotification($id, $get_user->id , 'Booking Accepted', 'Your booking has been accepted by ' . $get_captain->name);
            Global_helper::SaveNotification($id,$get_captain->id,'Booking Accepted','You have accepted the booking of ' . $get_user->name);
            $this->sendNotificationToUser($get_user->fcm_token, 'Booking Accepted', 'Your booking has been accepted by ' . $get_captain->name);




            return response()->json(['status' => 'OK', 'message' => 'Booking Accepted successfully'], 200);
        }

        // captain side cancel booking
        if ($request->booking_status == 5 && $request->user->role_id == 2) {
            $get_booking = Booking::where('id', $id)->first();
            // if ($get_booking->booking_status != 1) {
            //     return response()->json(['status' => 'Error', 'message' => 'Booking status is not accepted'], 401);
            // }
            DB::table('tbl_booking')->where('id', $id)->update(['booking_status' => 5, 'captain_id' => $request->user->id]);
            DB::table('tbl_booking_log')->where('captain_id', $request->user->id)->where('booking_id', $id)->update(['status' => 2]);
            DB::table('tbl_booking_log')->insert(['captain_id' => $request->user->id, 'booking_id' => $id, 'user_id' => $get_booking->user_id, 'booking_type' => 5]);
            $get_captain = DB::table('users')->where('id', $request->user->id)->first();
            Global_helper::SaveNotification($id,$get_user->id,'Booking Cancelled','Your booking has been cancelled by ' . $get_captain->name);
            Global_helper::SaveNotification($id,$get_captain->id,'Booking Cancelled','You have cancelled the booking of ' . $get_user->name);
            $this->sendNotificationToUser($get_user->fcm_token,'Booking Cancelled','Your booking has been cancelled by ' . $get_captain->name);


            return response()->json(['status' => 'OK', 'message' => 'Booking Cancel successfully'], 200);
        }

        // user side cancel booking
        if ($request->booking_status == 5 && $request->user->role_id == 3) {
            $get_booking = Booking::where('id', $id)->first();
            // if ($get_booking->booking_status != 1) {
            //     return response()->json(['status' => 'Error', 'message' => 'Booking status is not accepted'], 401);
            // }
            DB::table('tbl_booking')->where('id', $id)->update(['booking_status' => 5]);
            DB::table('tbl_booking_log')->where('user_id', $request->user->id)->where('booking_id', $id)->update(['status' => 2]);
            DB::table('tbl_booking_log')->insert(['user_id' => $request->user->id, 'booking_id' => $id, 'booking_type' => 5]);
            if(!empty($get_booking->cpatain_id)){
                Global_helper::SaveNotification($id,$get_captain->id,'Booking Cancelled','The booking has been cancelled by ' . $get_user->name);
                $this->sendNotificationToUser($get_captain->fcm_token,'Booking Cancelled','The booking has been cancelled by ' . $get_user->name);

            }
            $get_captain = DB::table('users')->where('id', $get_booking->captain_id)->first();
            Global_helper::SaveNotification($id,$get_user->id,'Booking Cancelled','You have cancelled the booking of ');


            return response()->json(['status' => 'OK', 'message' => 'Booking Cancel successfully'], 200);
        }

        // captain side complete booking
        if ($request->booking_status == 4) {

            $get_booking = Booking::where('id', $id)->first();
            // if ($get_booking->booking_status != 1) {
            //     return response()->json(['status' => 'Error', 'message' => 'Booking status is not accepted'], 401);
            // }
            DB::table('tbl_booking')->where('id', $id)->update(['booking_status' => 4]);
            DB::table('tbl_booking_log')->where('captain_id', $request->user->id)->where('booking_id', $id)->update(['status' => 2]);
            DB::table('tbl_booking_log')->insert(['captain_id' => $request->user->id, 'booking_id' => $id, 'user_id' => $get_booking->user_id, 'booking_type' => 4]);
            $get_captain = DB::table('users')->where('id', $get_booking->captain_id)->first();
            Global_helper::SaveNotification($id,$get_user->id,'Booking Completed','Your booking has been completed by ' . $get_captain->name);
            Global_helper::SaveNotification($id,$get_captain->id,'Booking Completed','You have completed the booking of ' . $get_user->name);
            $this->sendNotificationToUser($get_user->fcm_token,'Booking Completed','Your booking has been completed by ' . $get_captain->name);
            DB::table('tbl_booking')->where('id',$get_captain->id)->update(['current_address'=>$get_booking->drop_address]);
            $captain_active = DB::table('users')->where('id',$get_captain->id)->update(['is_booking_active'=>2]);

            return response()->json(['status' => 'OK', 'message' => 'Booking Completed successfully'], 200);
        }
    }

    public function accept_booking(Request $request, $booking_id)
    {

        $check_exist_booking = Booking::where('accept_user_id', $request->user->id)->where('status', 1)->where('booking_status', 2)->first();
        if ($check_exist_booking) {
            return response()->json(['status' => 'Error', 'message' => 'You have already accepted a booking'], 401);
        }
        $get_booking = Booking::where('id', $booking_id)->first();
        $get_booking_percentage_amount =  ($get_booking->booking_amount * $get_booking->booking_percentage) / 100 + $get_booking->booking_tax;
        $get_user_wallet = DB::table('users')->where('status', 1)->where('id', $request->user->id)->first();
        if ($get_user_wallet->vehicle_type == '' || $get_user_wallet->vehicle_capicity == '' || $get_user_wallet->registration_number == '' || $get_user_wallet->service_expiry_date == '') {
            return response()->json(['status' => 'Error', 'message' => 'Please complete your profile to accept this booking'], 401);
        }
        if ($get_user_wallet->wallet_amount >= $get_booking_percentage_amount) {
            $main_wallet = $get_user_wallet->wallet_amount - $get_booking_percentage_amount;
            DB::table('users')->where('id', $request->user->id)->update(['wallet_amount' => $main_wallet,  'reserve_amount' => $get_booking_percentage_amount, 'withdraw_amount' => $main_wallet, 'updated_at' => date('Y-m-d H:i:s')]);
            DB::table('tbl_booking_log')->insert(['user_id' => $request->user->id, 'booking_id' => $booking_id, 'booking_type' => 2]);
            DB::table('tbl_booking')->where('id', $booking_id)->update(['booking_status' => 2, 'accept_user_id' => $request->user->id, 'accept_user_vehicle_type' => $get_user_wallet->vehicle_type, 'accept_user_vehicle_capicity' => $get_user_wallet->vehicle_capicity, 'accept_user_registration_number' => $get_user_wallet->registration_number, 'accept_user_service_expiry_date' => $get_user_wallet->service_expiry_date]);
            DB::table('tbl_statement')->insert(['user_id' => $request->user->id, 'booking_id' => $get_booking->id, 'transaction_type' => 1, 'payment_type' => 2, 'amount' => $get_booking_percentage_amount, 'payment_status' => 3]);
            return response()->json(['status' => 'OK', 'message' => 'Booking status updated successfully'], 200);
        }
        return response()->json(['status' => 'Error', 'message' => 'Insufficient wallet balance'], 400);
    }

    public function complete_booking(Request $request, $booking_id)
    {
        $get_booking = Booking::where('id', $booking_id)->first();
        if ($get_booking->booking_status != 2) {
            return response()->json(['status' => 'Error', 'message' => 'Booking status is not accepted'], 401);
        }
        $booking_accept_user = DB::table('users')->where('status', 1)->where('id', $get_booking->accept_user_id)->first();
        $get_admin_wallet = DB::table('users')->where('status', 1)->where('id', 1)->first();
        $booking_post_user = DB::table('users')->where('status', 1)->where('id', $get_booking->user_id)->first();
        $post_user_commision =   ($booking_accept_user->reserve_amount * $get_booking->booking_post_percentage) /  100 - $get_booking->booking_post_tds;
        $final_post_user_commision = $booking_post_user->wallet_amount + $post_user_commision;
        $admin_commision = $booking_accept_user->reserve_amount - $post_user_commision;
        $final_admin_commision = $get_admin_wallet->wallet_amount + $admin_commision;
        // accept user booking
        DB::table('users')->where('id', $get_booking->accept_user_id)->update(['reserve_amount' => 0, 'withdraw_amount' => 0, 'updated_at' => date('Y-m-d H:i:s')]);
        DB::table('tbl_statement')->where('user_id', $get_booking->accept_user_id)->where('booking_id', $get_booking->id)->update(['payment_status' => 1]);
        // admin commision user booking
        DB::table('users')->where('id', 1)->update(['wallet_amount' => $final_admin_commision, 'updated_at' => date('Y-m-d H:i:s')]);
        DB::table('tbl_statement')->insert(['user_id' => 1, 'booking_id' => $get_booking->id, 'transaction_type' => 2, 'payment_type' => 1, 'amount' => $admin_commision, 'payment_status' => 1]);
        DB::table('tbl_booking_log')->insert(['user_id' => $get_booking->accept_user_id, 'booking_id' => $get_booking->id, 'booking_type' => 3]);
        DB::table('tbl_booking')->where('id', $get_booking->id)->update(['booking_status' => 3]);
        // post user commission
        DB::table('tbl_statement')->insert(['user_id' => $get_booking->user_id,  'booking_id' => $get_booking->id, 'transaction_type' => 4, 'payment_type' => 1, 'amount' => $post_user_commision, 'payment_status' => 1]);
        DB::table('users')->where('id', $get_booking->user_id)->update(['wallet_amount' => $final_post_user_commision, 'updated_at' => date('Y-m-d H:i:s')]);
        return response()->json(['status' => 'OK', 'message' => 'Booking accepted successfully'], 200);
    }
    public function cancel_booking(Request $request, $booking_id)
    {
        $get_booking = Booking::where('id', $booking_id)->first();
        if ($get_booking->booking_status != 2) {
            return response()->json(['status' => 'Error', 'message' => 'Booking status is not accepted'], 400);
        }
        $booking_accept_user = DB::table('users')->where('status', 1)->where('id', $get_booking->accept_user_id)->first();
        $get_admin_wallet = DB::table('users')->where('status', 1)->where('id', 1)->first();
        $booking_post_user = DB::table('users')->where('status', 1)->where('id', $get_booking->user_id)->first();
        $post_user_commision =   ($booking_accept_user->reserve_amount * $get_booking->booking_post_percentage) /  100 - $get_booking->booking_post_tds;
        $final_post_user_commision = $booking_post_user->wallet_amount + $post_user_commision;
        $admin_commision = $booking_accept_user->reserve_amount - $post_user_commision;
        $final_admin_commision = $get_admin_wallet->wallet_amount + $booking_accept_user->reserve_amount;
        // accept user booking
        DB::table('users')->where('id', $get_booking->accept_user_id)->update(['reserve_amount' => 0, 'withdraw_amount' => 0, 'updated_at' => date('Y-m-d H:i:s')]);
        DB::table('tbl_statement')->where('user_id', $get_booking->accept_user_id)->where('booking_id', $get_booking->id)->update(['payment_status' => 1]);
        // admin commision user booking
        DB::table('users')->where('id', 1)->update(['wallet_amount' => $final_admin_commision, 'updated_at' => date('Y-m-d H:i:s')]);
        DB::table('tbl_statement')->insert(['user_id' => 1, 'transaction_type' => 5, 'booking_id' => $get_booking->id, 'payment_type' => 1, 'amount' => $booking_accept_user->reserve_amount, 'payment_status' => 1]);
        DB::table('tbl_booking_log')->insert(['user_id' => $get_booking->accept_user_id, 'booking_id' => $get_booking->id, 'booking_type' => 4]);
        DB::table('tbl_booking')->where('id', $get_booking->id)->update(['booking_status' => 4]);
        // post user commission
        // DB::table('tbl_statement')->insert(['user_id' => $get_booking->user_id, 'transaction_type' => 4, 'payment_type' => 1, 'amount' => $post_user_commision , 'payment_status' => 1]);
        // DB::table('users')->where('id', $get_booking->user_id)->update(['wallet_amount' => $final_post_user_commision,'updated_at' => date('Y-m-d H:i:s')]);
        return response()->json(['status' => 'OK', 'message' => 'Booking status updated successfully'], 200);
    }
    
    
    public function cancel_booking_for_driver(Request $request , $id){
        
  
            $get_booking = Booking::where('id', $id)->first();
            // if ($get_booking->booking_status != 1) {
            //     return response()->json(['status' => 'Error', 'message' => 'Booking status is not accepted'], 401);
            // }
            // DB::table('tbl_booking')->where('id', $id)->update(['booking_status' => 5, 'captain_id' => $request->user->id]);
            DB::table('tbl_booking_log')->where('captain_id', $request->user->id)->where('booking_id', $id)->update(['status' => 2]);
          


            return response()->json(['status' => 'OK', 'message' => 'Booking Cancel successfully'], 200);
        
        
    }


    /**
     * Update wallets and logs for booking acceptance.
     */
    private function updateWalletsAndLogs($userId, $bookingId, $adminAmount, $postUserWallet, $postUserId, $postUserBookingAmount)
    {
        DB::table('users')->where('id', $userId)->update([
            'reserve_amount' => 0,
            'withdraw_amount' => 0,
            'updated_at' => now()
        ]);

        DB::table('users')->where('id', 1)->update([
            'wallet_amount' => $adminAmount,
            'updated_at' => now()
        ]);

        DB::table('tbl_statement')->insert([
            'user_id' => 1,
            'transaction_type' => 2,
            'payment_type' => 1,
            'amount' => $adminAmount,
            'payment_status' => 1
        ]);

        DB::table('tbl_booking_log')->insert([
            'user_id' => $userId,
            'booking_id' => $bookingId,
            'booking_type' => 3
        ]);

        DB::table('tbl_booking')->where('id', $bookingId)->update(['booking_status' => 3]);

        if ($postUserId) {
            DB::table('tbl_statement')->insert([
                'user_id' => $postUserId,
                'transaction_type' => 4,
                'payment_type' => 1,
                'amount' => $postUserBookingAmount,
                'payment_status' => 1
            ]);

            DB::table('users')->where('id', $postUserId)->update([
                'wallet_amount' => $postUserWallet,
                'updated_at' => now()
            ]);
        }
    }


    public function fetch_my_booking(Request $request, $id)
    {

        $query  = DB::table('tbl_booking')->where('status', 1);
        if ($id == 1) {
            $query->whereIn('booking_status', [4, 5])->where('user_id', $request->user->id);
        } else {
            $query->whereIn('booking_status', [4, 5])->where('captain_id', $request->user->id);
        }
        $booking = $query->orderBy('id','desc')->get();
        if ($booking) {
            return response()->json(['status' => 'OK', 'message' => 'Booking fetched successfully', 'data' => $booking], 200);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'No booking found'], 401);
        }
    }

    public function wallet_statement(Request $request)
    {

        $user_wallet = DB::table('tbl_statement')->where('user_id', $request->user->id)->get();
        if ($user_wallet) {
            return response()->json(['status' => 'OK', 'message' => 'Wallet statement fetched successfully', 'data' => $user_wallet], 200);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'No wallet statement found'], 401);
        }
    }





    public function get_aadhar_otp(Request $post)
    {
        $rules = array(
            'register_aadhar' => 'required'
        );
        $validate = \Myhelper::FormValidator($rules, $post);
        if ($validate != "no") {
            return $validate;
        }
        $aes_key = "3c8cdd3e3028795dacf67ef25a89509a989768b067a7b591cc468954ad4e1620";
        $aes_iv = "ec5bad40b2162069";
        $user_data = array(
            'p1' => "Advance",
            "p2" => $post->register_aadhar,
            "p3" => "sdfgs6848"
        );
        $encrypt_data = \Myhelper::newEncrypt(json_encode($user_data), $aes_key, $aes_iv);
        $aadharRecord = \DB::table("kycdatas")->where("type", "aadhar")->where('number', $post->register_aadhar)->first();
        if (!$aadharRecord) {
            $url = "http://192.168.0.181:8000/api/v1/validate/aadhar";
            $header = array(
                'Accept: application/json',
                'Content-Type: application/json',
                'client_id: 98dfe4dbc68bb6948a85137927f857e0',
                'x-api-key: 596e6fc87495e86afb31437b866cce1e00a1248169a90f0fa8eefc230a0b7af4',
            );
            $parameter['body'] = $encrypt_data;
            $result = \Myhelper::curl($url, "POST", json_encode($parameter), $header, "yes", "report", $post->register_aadhar);
            $dec_res = json_decode($result['response']);
            $decrypt_data = \Myhelper::newDecrypt($dec_res->body, $aes_key, $aes_iv);
            if ($decrypt_data != "") {
                $response = json_decode($decrypt_data);
                if (isset($response->data->data->otp_sent) && $response->data->data->otp_sent === true) {
                    return response()->json(['status' => 'TXNOTP', 'message' => "Aadhar verify successfully", "client_id" => $response->data->transaction_id], 200);
                } else {
                    return response()->json(['status' => 'ERR', 'message' => isset($response->message) ? $response->message : "Please contact your administrator"], 401);
                }
            } else {
                return response()->json(['status' => 'ERR', 'message' => "Please contact your administrator"], 401);
            }
        } else {
            $response = json_decode($aadharRecord->response);
            return response()->json([
                'status'  => 'TXN',
                'message' => "Aadhar re-verified successfully",
                "profile" => "data:image/png;base64, " . $response->profile_image,
                "mobile"  => $aadharRecord->mobile,
                'state'   => $response->address->state,
                'pincode' => $response->zip,
                'city'    => $response->address->po,
                'address' => $response->address->house . " " . $response->address->street . " " . $response->address->loc
            ]);
        }
    }

    public function checkaadharotp(Request $post)
    {
        $rules = array(
            'otp'       => 'required',
            'client_id' => "required",
            'mobile'    => "required"
        );
        $validate = \Myhelper::FormValidator($rules, $post);
        if ($validate != "no") {
            return $validate;
        }
        $aes_key = "3c8cdd3e3028795dacf67ef25a89509a989768b067a7b591cc468954ad4e1620";
        $aes_iv = "ec5bad40b2162069";
        $user_data = array(
            'p1' => "Advance",
            "p2" => $post->otp,
            "p3" => $post->client_id
        );
        $encrypt_data = \Myhelper::newEncrypt(json_encode($user_data), $aes_key, $aes_iv);
        $url = "http://192.168.0.181:8000/api/v1/validate/otp-submit";
        $header = array(
            'Accept: application/json',
            'Content-Type: application/json',
            'client_id: 98dfe4dbc68bb6948a85137927f857e0',
            'x-api-key: 596e6fc87495e86afb31437b866cce1e00a1248169a90f0fa8eefc230a0b7af4',
        );
        $parameter['body'] = $encrypt_data;
        $result = \Myhelper::curl($url, "POST", json_encode($parameter), $header, "yes", "report", $post->mobile);
        $dec_res = json_decode($result['response']);
        $decrypt_data = \Myhelper::newDecrypt($dec_res->body, $aes_key, $aes_iv);
        if ($decrypt_data != "") {
            $response = json_decode($decrypt_data);
            if (isset($response->status) && $response->status === true) {
                \DB::table("kycdatas")->insert([
                    "type"   => "aadhar",
                    "name"   => $response->data->data->full_name,
                    "number" => $response->data->data->aadhaar_number,
                    "mobile" => $post->mobile,
                    "state"  => $post->client_id,
                    "response" => json_encode($response->data),
                    'user_id' => \Auth::id()
                ]);
                return response()->json([
                    'status'  => 'TXN',
                    'message' => "Aadhar verified successfully",
                    "profile" => "data:image/png;base64, " . $response->data->data->profile_image,
                    "mobile"  => $post->mobile,
                    'state'   => $response->data->data->address->state,
                    'pincode' => $response->data->data->zip,
                    'city'    => $response->data->data->address->po,
                    'address' => $response->data->data->address->house . " " . $response->data->data->address->street . " " . $response->data->data->address->landmark . " " . $response->data->data->address->loc
                ]);
            } else {
                return response()->json(['status' => 'ERR', 'message' => isset($response->message) ? $response->message : "Please contact your administrator"], 401);
            }
        } else {
            return response()->json(['status' => 'ERR', 'message' => "Please contact your administrator"], 401);
        }
    }

    public function update_kyc(Request $request)
    {
        $user = $request->user;
        $user_id = $user->id;
        $user_update = Kycprocess::where('user_id', $user_id)->first();
        if (!$user_update) {
            $user_update = new Kycprocess();
            $user_update->kyc_status = 1;
            $user_update->user_id = $user_id;
        }
        if ($request->aadhar_no) {
            $user_update->aadhar_no = $request->aadhar_no;
        }
        if ($request->aadhar_name) {
            $user_update->aadhar_name = $request->aadhar_name;
        }
        if ($request->aadhar_father_name) {
            $user_update->aadhar_father_name = $request->aadhar_father_name;
        }
        if ($request->aadhar_dob) {
            $user_update->aadhar_dob = $request->aadhar_dob;
        }
        if ($request->aadhar_zipcode) {
            $user_update->aadhar_zipcode = $request->aadhar_zipcode;
        }
        if ($request->aadhar_country) {
            $user_update->aadhar_country = $request->aadhar_country;
        }
        if ($request->aadhar_state) {
            $user_update->aadhar_state = $request->aadhar_state;
        }
        if ($request->aadhar_city) {
            $user_update->aadhar_city = $request->aadhar_city;
        }
        if ($request->aadhar_address) {
            $user_update->aadhar_address = $request->aadhar_address;
        }
        if ($request->aadhar_profile_photo) {
            $user_update->aadhar_profile_photo = $request->aadhar_profile_photo;
        }
        if ($request->aadhar_mobile_no) {
            $user_update->aadhar_mobile_no = $request->aadhar_mobile_no;
        }
        if ($request->is_aadhar_verified) {
            $user_update->is_aadhar_verified = $request->is_aadhar_verified;
        }
        if ($request->pan_no) {
            $user_update->pan_no = $request->pan_no;
        }
        if ($request->pan_name) {
            $user_update->pan_name = $request->pan_name;
        }
        if ($request->is_pan_verified) {
            $user_update->is_pan_verified = $request->is_pan_verified;
        }
        if ($request->ifsc_code) {
            $user_update->ifsc_code = $request->ifsc_code;
        }
        if ($request->account_no) {
            $user_update->account_no = $request->account_no;
        }
        if ($request->bank_name) {
            $user_update->bank_name = $request->bank_name;
        }
        if ($request->account_holder_name) {
            $user_update->account_holder_name = $request->account_holder_name;
        }
        if ($request->is_bank_verified) {
            $user_update->is_bank_verified = $request->is_bank_verified;
        }
        if ($request->hasFile('live_photo')) {
            $file = $request->file('live_photo');
            $filePath = $file->store('kyc', 'public');
            $user_update->live_photo = $filePath;
        }
        if ($request->hasFile('live_video')) {
            $file = $request->file('live_video');
            $filePath = $file->store('kyc', 'public');
            $user_update->live_video = $filePath;
        }
        $user_update->save();
        return response()->json(['status' => 'OK', 'message' => "KYC updated successfully"]);
    }

    public function get_services()
    {
        $get_service = Service::where('status', 1)->get();
        if ($get_service) {
            return response()->json(['status' => 'Success', 'message' => 'Services fetched successfully', 'data' => $get_service]);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'No services found']);
        }
    }

    public function get_packages()
    {
        $get_package = Package::where('status', 1)->orderBy('id', 'desc')->get();
        $add_package_service = array();
        if (!empty($get_package)) {
            foreach ($get_package as $pack) {
                $pack->service = DB::table('add_package_service as a')->leftJoin('services as b', 'b.id', '=', 'a.service_id')->select('a.package_id', 'a.service_id', 'b.*')->where('a.status', 1)->where('b.status', 1)->where('a.package_id', $pack->id)->get();
                $add_package_service[] = $pack;
            }
        }

        if ($add_package_service) {
            return response()->json(['status' => 'Success', 'message' => 'Packages fetched successfully', 'data' => $add_package_service]);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'No packages found']);
        }
    }

    public function create_pet(Request $request)
    {
        $rules = array(
            'pet_name'       => 'required',
            'pet_image' => "required",
        );
        $validate = \Myhelper::FormValidator($rules, $request);
        if ($validate != "no") {
            return $validate;
        }
        $check_data = $this->check_exist_data($request, null);
        if ($check_data) {
            $message = '';
            if ($check_data->title == $request->pet_name) {
                $message .= "Pet Category ";
            }
            if ($message) {
                return response()->json(['status' => 'Error', 'message' => $message . 'already exists.']);
            }
        }
        $pet = new PetCategory();
        if ($request->pet_name) {
            $pet->title = $request->pet_name;
        }
        $pet->user_id = $request->user->id;
        if ($request->hasFile('pet_image')) {
            $file = $request->file('pet_image');
            $filePath = $file->store('pet_category', 'public');
            $pet->image = $filePath;
        }
        if ($request->pet_size) {
            $pet->pet_size = $request->pet_size;
        }
        if ($request->pet_bred) {
            $pet->pet_bred = $request->pet_bred;
        }
        $pet->save();
        return response()->json(['status' => 'OK', 'message' => "Pet Add Successfully"]);
    }

    public function list_pet(Request $request)
    {
        $get_pet = PetCategory::where('user_id', $request->user->id)->where('status', 1)->get();
        if ($get_pet) {
            return response()->json(['status' => 'Success', 'message' => 'Pet List Successfully', 'data' => $get_pet]);
        }
    }

    public function update_pet(Request $request, $id)
    {
        if (!$id) {
            return response()->json(['status' => 'Error', 'message' => 'Pet ID is required']);
        }
        if ($request->method() == "GET") {
            if (!empty($id)) {
                $get_single_pet = PetCategory::where('id', $id)->where('status', 1)->get();
                if ($get_single_pet) {
                    return response()->json(['status' => 'Success', 'message' => 'Single Pet Fetch Successfully', 'data' => $get_single_pet]);
                }
            }
        }

        if ($request->method() == "POST") {
            $rules = array(
                'pet_name'       => 'required',
            );
            $validate = \Myhelper::FormValidator($rules, $request);
            if ($validate != "no") {
                return $validate;
            }
            $check_data = $this->check_exist_data($request, $id);
            if ($check_data) {
                $message = '';
                if ($check_data->title == $request->pet_name) {
                    $message .= "Pet Category ";
                }
                if ($message) {
                    return response()->json(['status' => 'ERR', 'message' => "Pet Category Already Exists"]);
                }
            }
            $pet = PetCategory::findOrfail($id);

            if ($request->pet_name) {
                $pet->title = $request->pet_name;
            }
            $pet->user_id = $request->user->id;
            if ($request->hasFile('pet_image')) {
                $file = $request->file('pet_image');
                $filePath = $file->store('pet_category', 'public');
                $pet->image = $filePath;
            }
            if ($request->pet_size) {
                $pet->pet_size = $request->pet_size;
            }
            if ($request->pet_bred) {
                $pet->pet_bred = $request->pet_bred;
            }
            $pet->save();
            return response()->json(['status' => 'OK', 'message' => "Pet Update Successfully"]);
        }
    }





    public function check_exist_data($request, $id)
    {
        $query = PetCategory::where('status', '!=', 3);
        if ($id !== null) {
            $query->where('id', '!=', $id);
        }
        $check_pet_category = $query->where(function ($q) use ($request) {
            $q->where('title', $request->pet_name);
        })->first();

        return $check_pet_category;
    }

    public function delete_pet(Request $request)
    {
        $update_pet_status = PetCategory::where('id', $request->id)->update(['status' => 3]);
        if ($update_pet_status) {
            return response()->json(['message' => 'Pet deleted successfully.'], 200);
        }
    }

    public function fetch_company_info()
    {
        $company_info = CmsModal::where('status', 1)->first();
        if ($company_info) {
            return response()->json(['status' => 'OK', 'message' => 'Company Info fetched successfully', 'data' => $company_info], 200);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'Company Info not found']);
        }
    }

    public function fetch_category()
    {
        $get_category = CategoriesModal::where('status', 1)->get();
        if ($get_category) {
            return response()->json(['status' => 'OK', 'message' => 'Category fetched successfully', 'data' => $get_category], 200);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'Company Info not found']);
        }
    }

    public function fetch_property(Request $request)
    {

        if (isset($request->user->id) && $request->user->id) {
            $user_id = $request->user->id;
        } else {
            $user_id = "";
        }
        if (!isset($request->type)) {
            return response()->json(['status' => 'Error', 'message' => 'Type is required'], 400);
        }
        $type = $request->type;
        $get_category = CategoriesModal::where('status', 1)
            ->when($type != "all", function ($query) use ($type) {
                $query->where('id', $type);
            });
        $get_cate = $get_category->orderBy('id', 'asc')->get();
        $new_property_get = array();
        foreach ($get_cate as $row) {
            if (!empty($user_id)) {
                $get_property = DB::table('properties as p')->leftJoin('categories as pg', 'p.category_id', '=', 'pg.id')->leftJoin('whislist_property as c', 'p.id', '=', 'c.property_id')->select('p.*', 'pg.title as category_name', 'c.status as whislist_status')->where('p.status', 1)->where('pg.status', 1)->where('p.category_id', $row->id)->where('p.is_property_verified', 1)->get();
            } else {
                $get_property = DB::table('properties as p')->leftJoin('categories as pg', 'p.category_id', '=', 'pg.id')->select('p.*', 'pg.title as category_name')->where('p.status', 1)->where('pg.status', 1)->where('p.category_id', $row->id)->where('p.is_property_verified', 1)->get();
            }
            $get_fac = array();
            foreach ($get_property as $property) {
                $get_faciflties = DB::table('add_facilities_propery as a')->leftJoin('facilities as b', 'a.facilities_id', '=', 'b.id')->select('a.facilities_id', 'b.title as facility_name', 'a.value as facility_value', 'b.image as facility_image')->where('a.status', 1)->where('b.status', 1)->where('a.property_id', $property->id)->get();
                $get_amentities = DB::table('add_amenties as a')->leftJoin('amenities as b', 'a.amenities_id', '=', 'b.id')->select('a.amenities_id', 'b.title as amenities_name', 'b.image as amenities_image')->where('a.status', 1)->where('b.status', 1)->where('a.property_id', $property->id)->get();
                $get_sub_img = DB::table('properties_images')->where('property_id', $property->id)->where('status', 1)->get();
                $property->facilities = $get_faciflties;
                $property->amenities = $get_amentities;
                $property->sub_img =  $get_sub_img;
                $get_fac[] = $property;
            }

            $row->property = $get_property;
            $new_property_get[] = $row;
        }
        return response()->json(['status' => 'Success', 'data' => $new_property_get], 200);
    }


    public function fetch_testimonial()
    {
        $get_testimonial = Testimonal::where('status', 1)->get();
        if ($get_testimonial) {
            return response()->json(['status' => 'OK', 'message' => 'Testimonial fetched successfully', 'data' => $get_testimonial], 200);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'Testimonial not found']);
        }
    }

    public function fetch_blog(Request $request)
    {
        $get_blog = Blog::where('status', 1);
        if ($request->id) {
            $get_blog->where('id', $request->id);
        }
        $get_blog = $get_blog->get();
        if ($get_blog) {
            return response()->json(['status' => 'OK', 'message' => 'Blog fetched successfully', 'data' => $get_blog], 200);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'Blog not found']);
        }
    }

    public function fetch_banner(Request $request)
    {

        $get_banner = Banner::where('status', 1)->where('type', $request->type)->get();
        if ($get_banner) {
            return response()->json(['status' => 'OK', 'message' => 'Banner fetched successfully', 'data' => $get_banner], 200);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'Banner not found']);
        }
    }

    public function fetch_seo(Request $request)
    {
        $get_seo = Seo::where('status', 1)->where('url', $request->url)->first();
        if ($get_seo) {
            return response()->json(['status' => 'OK', 'message' => 'SEO fetched successfully', 'data' => $get_seo], 200);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'SEO not found']);
        }
    }

    public function fetch_gallary(Request $request)
    {
        $get_gallary = Gallary::where('status', 1)->get();
        if ($get_gallary) {
            return response()->json(['status' => 'OK', 'message' => 'Gallery fetched successfully', 'data' => $get_gallary], 200);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'Gallery not found']);
        }
    }

    public function fetch_pages(Request $request)
    {

        $get_page = Page::where('page_name', $request->page_name)->first();
        if ($get_page) {
            return response()->json(['status' => 'OK', 'message' => 'Page fetched successfully', 'data' => $get_page], 200);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'Page not found']);
        }
    }

    public function send_enquiry(Request $request)
    {
        $company_info = CmsModal::where('status', 1)->first();
        if ($request->name == '') {
            return response()->json(['status' => 'Error', 'message' => 'Name is required'], 400);
        }

        if ($request->email == '' || !filter_var($request->email, FILTER_VALIDATE_EMAIL)) {
            return response()->json(['status' => 'Error', 'message' => 'A valid email is required'], 400);
        }

        if ($request->mobile_no == '' || !preg_match('/^\d{10}$/', $request->mobile_no)) {
            return response()->json(['status' => 'Error', 'message' => 'Mobile number must be a 10-digit integer'], 400);
        }

        Mail::to($company_info->email)->send(new Enquirys($request));
        $enc = new Enquiry();
        $enc->name = $request->name;
        $enc->email = $request->email;
        $enc->mobile_no = $request->mobile_no;
        $enc->message = $request->message;
        if ($request->property_id) {
            $enc->property_id = $request->property_id;
        }
        if ($request->location) {
            $enc->location = $request->location;
        }
        if ($request->budget) {
            $enc->budget = $request->budget;
        }
        if ($request->plan_date) {
            $enc->plan_date = $request->plan_date;
        }
        $enc->save();
        DB::table('notes')->insert(['loan_request_id' => $enc->id, 'user_id' => 1, 'loan_status' => 1, 'title' => "Initial Stage"]);
        return response()->json(['status' => 'OK', 'message' => 'Enquiry sent successfully'], 200);
    }

    public function post_review(Request $request)
    {
        $user_id = $request->user->id;
        $review = new PropertyReview();
        $review->user_id = $user_id;
        $review->booking_id = $request->booking_id;
        $review->review = $request->review;
        $review->rating = $request->rating;
        $review->save();
        return response()->json(['status' => 'OK', 'message' => 'Review posted successfully'], 200);
    }

    public function fetch_review()
    {
        $reviews = DB::table('property_reviews as a')->join('users as b', 'a.user_id', '=', 'b.id')->select('a.*', 'b.name as user_name', 'b.image as user_image')->where('a.status', 1)->where('b.status', 1)->get();
        if ($reviews) {
            return response()->json(['status' => 'OK', 'data' => $reviews], 200);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'No reviews found'], 404);
        }
    }


    public function property_whislist(Request $request)
    {

        $check_whislist = DB::table('whislist_property')->where('user_id', $request->user->id)->where('property_id', $request->property_id)->first();
        $add_whislist = DB::table('whislist_property')->insert(['user_id' => $request->user->id, 'property_id' => $request->property_id]);
        if ($check_whislist) {
            if ($check_whislist->status == 1) {
                $update_whislist_status = DB::table('whislist_property')->where('user_id', $request->user->id)->where('property_id', $request->property_id)->update(['status' => 2]);
            } else {
                $update_whislist_status = DB::table('whislist_property')->where('user_id', $request->user->id)->where('property_id', $request->property_id)->update(['status' => 1]);
            }
        } else {
            if ($add_whislist) {
                return response()->json(['status' => 'OK', 'message' => 'Property whitelisted successfully'], 200);
            } else {
                return response()->json(['status' => 'Error', 'message' => 'Failed to whitelist property'], 500);
            }
        }
    }

    public function fetch_single_property(Request $request, $id)
    {
        if (isset($request->user->id) && $request->user->id) {
            $user_id = $request->user->id;
        } else {
            $user_id = "";
        }
        if (!isset($request->cat)) {
            return response()->json(['status' => 'Error', 'message' => 'Type is required'], 400);
        }
        $type = $request->cat;
        $get_category = CategoriesModal::where('status', 1)
            ->when($type != "all", function ($query) use ($type) {
                $query->where('id', $type);
            });
        $get_cate = $get_category->orderBy('id', 'asc')->get();
        $new_property_get = array();
        foreach ($get_cate as $row) {
            if (!empty($user_id)) {
                $get_property = DB::table('properties as p')->leftJoin('categories as pg', 'p.category_id', '=', 'pg.id')->leftJoin('whislist_property as c', 'p.id', '=', 'c.property_id')->select('p.*', 'pg.title as category_name', 'c.status as whislist_status')->where('p.status', 1)->where('pg.status', 1)->where('p.category_id', $row->id)->where('p.is_property_verified', 1)->where('p.id', $id)->get();
            } else {
                $get_property = DB::table('properties as p')->leftJoin('categories as pg', 'p.category_id', '=', 'pg.id')->select('p.*', 'pg.title as category_name')->where('p.status', 1)->where('pg.status', 1)->where('p.category_id', $row->id)->where('p.is_property_verified', 1)->where('p.id', $id)->get();
            }
            $get_fac = array();
            foreach ($get_property as $property) {
                $get_faciflties = DB::table('add_facilities_propery as a')->leftJoin('facilities as b', 'a.facilities_id', '=', 'b.id')->select('a.facilities_id', 'b.title as facility_name', 'a.value as facility_value', 'b.image as facility_image')->where('a.status', 1)->where('b.status', 1)->where('a.property_id', $property->id)->get();
                $get_amentities = DB::table('add_amenties as a')->leftJoin('amenities as b', 'a.amenities_id', '=', 'b.id')->select('a.amenities_id', 'b.title as amenities_name', 'b.image as amenities_image')->where('a.status', 1)->where('b.status', 1)->where('a.property_id', $property->id)->get();
                $get_sub_img = DB::table('properties_images')->where('property_id', $property->id)->where('status', 1)->get();
                $reviews = DB::table('property_reviews as a')
                    ->join('users as b', 'a.user_id', '=', 'b.id')
                    ->leftJoin('properties as c', 'c.id', '=', 'a.property_id') // Added left join
                    ->select(
                        'a.*',
                        'b.name as user_name',
                        'b.image as user_image'
                    )
                    ->where('a.status', 1)
                    ->where('b.status', 1)
                    ->where('c.status', 1)
                    ->where('a.property_id', $property->id)
                    ->get();
                $property->facilities = $get_faciflties;
                $property->amenities = $get_amentities;
                $property->sub_img =  $get_sub_img;
                $property->review =  $reviews;
                $get_fac[] = $property;
            }

            $row->property = $get_property;
            $new_property_get[] = $row;
        }
        return response()->json(['status' => 'Success', 'data' => $new_property_get], 200);
    }

    public function permission(Request $request)
    {
        $role_id = $request->user->role_id;
        $permission_name = $request->title;
        try {
            // Fetch the permission data from the database
            $get_permission = DB::table('role_permission as a')
                ->join('permissions as b', 'a.permission_id', '=', 'b.id')
                ->join('permission_category as c', 'b.per_cate_id', '=', 'c.id')
                ->select('a.*', 'b.title', 'c.category_name')
                ->where('a.status', 1)
                ->where('b.status', 1)
                ->where('c.status', 1)
                ->where('a.role_id', $role_id)
                ->where('b.title', $permission_name)
                ->first();

            // Check if permission data exists and if the permission_status is 1
            if ($get_permission && $get_permission->permission_status == 1) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Permission granted',
                    'permission_status' => 1
                ], 200);
            }

            return response()->json([
                'status' => 'error',
                'message' => 'Permission denied',
                'permission_status' => 2
            ], 200);
        } catch (\Exception $e) {
            // Handle errors and return a proper response
            return response()->json([
                'status' => 'error',
                'message' => 'Something went wrong: ' . $e->getMessage()
            ], 500);
        }
    }

    public function update_profile(Request $request)
    {

        $user_id = $request->user->id;
        $user = User::findOrFail($request->user->id);
        if ($request->name) {
            $user->name = $request->name;
        }
        if ($request->email) {
            $user->email = $request->email;
        }
        if ($request->mobile_no) {
            $user->mobile_no = $request->mobile_no;
        }
        if ($request->vehicle_type) {
            $user->vehicle_type = $request->vehicle_type;
        }
        if ($request->vehicle_number) {
            $user->vehicle_number = $request->vehicle_number;
        }
        if ($request->lat) {
            $user->lat = $request->lat;
        }
        if ($request->long) {
            $user->long = $request->long;
        }
        // if(!empty($request->lat) && !empty($request->long) ){
        //     $apiKey = 'e3236220140e4313b00c09c7e420d58b';
        //     $url = "https://api.opencagedata.com/geocode/v1/json?q={$request->lat}+{$request->long}&key={$apiKey}";
        //     $response = file_get_contents($url);
        //     $responseData = json_decode($response, true);
        //     if (!empty($responseData['results'])) {
        //         foreach ($responseData['results'][0]['components'] as $key => $value) {
        //             if ($key === 'postcode') {
        //               $user->pincode = $value;
        //             }
        //         }
        //     }
        // }
        if (!empty($request->lat) && !empty($request->long)) {
            $apiKey = 'e3236220140e4313b00c09c7e420d58b';
            $url = "https://api.opencagedata.com/geocode/v1/json?q={$request->lat}+{$request->long}&key={$apiKey}";


            // Fetch API response
            $response = file_get_contents($url);
            $responseData = json_decode($response, true);

            if (!empty($responseData['results'])) {
                $addressComponents = $responseData['results'][0]['components'];
            }
            // Save pincode
            if (isset($addressComponents['postcode'])) {
                $user->pincode = $addressComponents['postcode'];
            }

            // Save formatted address
            if (isset($responseData['results'][0]['formatted'])) {
                $user->address = $responseData['results'][0]['formatted'];
            }

            // Save other components if needed
            $user->city = $addressComponents['city'] ?? null;
            $user->state = $addressComponents['state'] ?? null;
            $user->country = $addressComponents['country'] ?? null;
        }
        if ($request->gst_no) {
            $user->gst_no = $request->gst_no;
        }
        if ($request->status) {
            $user->status = $request->status;
        }

        $user->save();
        return response()->json(['status' => 'OK', 'message' => 'Profile updated successfully'], 200);
    }

    public function booking(Request $request)
    {

        $validated = $request->validate([
            'booking_date' => 'required',
            'booking_time' => 'required'
        ]);
        $user_id = $request->user->id;
        $get_user1 = User::find($user_id);
        $get_user = DB::table('vehicles')->where('user_id', $request->user->id)->where('is_vehicle_default', 1)->first();
        if (!$get_user) {
            return response()->json(['status' => 'error', 'message' => 'Please Add Vehicle'], 400);
        }
        $get_active_bank = DB::table('banks')->where('is_bank_active', 1)->first();
        if (!$get_active_bank) {
            return response()->json(['status' => 'error', 'message' => 'Add Active Bank'], 400);
        }
        $check_service = Pincode::where('pin_code', $get_user1->pincode)->where('status', 1)->first();
        if (!$check_service) {
            return response()->json(['status' => 'error', 'message' => 'Service not available in your location'], 400);
        } else {
            $booking = new Booking();
            $booking->user_id = $user_id;
            $booking->booking_date = $request->booking_date;
            $booking->booking_time = $request->booking_time;
            $booking->description = $request->description;
            $booking->vehicle_type =   $get_user->vehicle_type;
            $booking->vehicle_number =   $get_user->vehicle_number;
            $booking->soc =   $request->soc;
            $booking->pincode =   $get_user1->pincode;
            $booking->country =   $get_user1->country;
            $booking->state =   $get_user1->state;
            $booking->city =   $get_user1->city;
            $booking->address =   $get_user1->address;
            $booking->name =   $get_user1->name;
            $booking->email =   $get_user1->email;
            $booking->mobile_no =   $get_user1->mobile_no;
            if ($request->booking_type) {
                $booking->booking_type = $request->booking_type;
            }
            $booking->save();
            DB::table('tbl_transaction')->insert([
                'user_id' => $request->user->id,
                'booking_id'  => $booking->id,
                'active_bank_id' => $get_active_bank->id
            ]);
            return response()->json(['status' => 'OK', 'message' => 'Booking request sent successfully'], 200);
        }
    }

    public function booking_list(Request $request)
    {
        $user_id = $request->user->id;
        $get_book_session = DB::table('bookings as a')
            ->leftJoin('users as b', 'a.user_id', '=', 'b.id')
            ->select(
                'a.*',
                'b.name as user_name',
                'b.email as user_email',
                'b.mobile_no as user_mobile'
            )
            ->where('a.status', 1)
            ->where('b.status', 1)
            ->where('a.user_id', $user_id)->orderBy('a.id', 'desc')
            ->get();
        if ($get_book_session) {
            return response()->json([
                'status' => 'OK',
                'message' => 'Book Session Fetched Successfully',
                'data' => $get_book_session
            ], 200);
        } else {
            return response()->json([
                'status' => 'error',
                'meesage' => 'data not found'
            ]);
        }
    }

    public function get_booking(Request $request, $id)
    {

        $get_booking = DB::table('bookings')->where('id', $id)->first();
        if ($get_booking) {
            return response()->json([
                'status' => 'OK',
                'message' => 'Get Book Session Fetched Successfully',
                'data' => $get_booking
            ], 200);
        } else {
            return response()->json([
                'status' => 'error',
                'meesage' => 'data not found'
            ]);
        }
    }

    public function booking_update(Request $request)
    {

        //  $validated = $request->validate([
        //         'booking_date' => 'required',
        //         'booking_time' => 'required'
        //     ]);
        $user_id = $request->user->id;
        $booking = Booking::find($request->hidden_id);
        if ($request->booking_date && $request->booking_time) {
            $booking->booking_date = $request->booking_date;
            $booking->booking_time = $request->booking_time;
        }
        if ($request->booking_status) {
            $booking->booking_status = $request->booking_status;
        }
        if ($request->description) {
            $booking->description = $request->description;
        }
        $booking->save();
        return response()->json(['status' => 'OK', 'message' => 'Booking Schedule update successfully'], 200);
    }



    public function uploadProfilePicture(Request $request)
    {
        $user_id = $request->user->id;
        // Validate the uploaded file
        $request->validate([
            'profile_picture' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048', // 2MB Max
        ]);

        // Store the file
        if ($request->hasFile('profile_picture')) {
            $file = $request->file('profile_picture');
            $filename = uniqid() . '.' . $file->getClientOriginalExtension();
            $path = $file->storeAs('profile-pictures', $filename, 'public');
            DB::table('users')->where('id', $user_id)->update(['image' => $path]);
            // Respond with the file path
            return response()->json([
                'success' => true,
                'message' => 'Profile picture uploaded successfully!',
                'file_path' => Storage::url($path)
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'Failed to upload profile picture.'
        ], 500);
    }

    public function get_user(Request $request)
    {

        $user_id = $request->user->id;
        $get_user = User::where('status', 1)->where('id', $user_id)->get();
        $user_data = [];
        foreach ($get_user as $user) {
            $user->vehicle_images = DB::table('tbl_vehicle_image')->where('status', 1)->where('user_id', $user_id)->get();
            $user_data[] = $user;
        }
        return response()->json(['status' => 'OK', 'message' => 'User details', 'data' => $user], 200);
    }

    public function about_us(Request $request)
    {
        $about_us = DB::table('pages')->where('id', 1)->first();
        return response()->json(['status' => 'OK', 'data' => $about_us], 200);
    }

    public function get_transaction(Request $request)
    {

        $get_transaction = DB::table('tbl_transaction')->where('user_id', $request->user->id)->orderBy('id', 'desc')->get();
        $new_arr = array();
        foreach ($get_transaction as $row) {
            $get_user_info = User::where('status', 1)->where('id', $row->user_id)->first();
            $get_booking_info = Booking::where('status', 1)->where('id', $row->booking_id)->first();
            $get_bank_info = DB::table('banks')->where('status', 1)->where('id', $row->active_bank_id)->first();
            $row->get_user_info = $get_user_info;
            $row->get_booking_info =  $get_booking_info;
            $row->get_bank_info =  $get_bank_info;
            $new_arr[] = $row;
        }

        return response()->json([
            'status' => 'OK',
            'message' => 'Get Transaction Info',
            'data' => $new_arr
        ], 200);
    }

    public function genrate_invoice(Request $request, $id)
    {
        $query = DB::table('tbl_transaction');
        if (isset($request->type)) {
            $query->where('user_id', $request->type);
        }
        if ($id) {
            $query->where('id', $id);
        }
        $get_transaction = $query->orderBy('id', 'desc')->get();
        $alltransaction = array();
        foreach ($get_transaction as $row) {
            $get_user_info = User::where('status', 1)->where('id', $row->user_id)->first();
            $get_booking_info = Booking::where('status', 1)->where('id', $row->booking_id)->first();
            $get_bank_info = DB::table('banks')->where('status', 1)->where('id', $row->active_bank_id)->first();
            $row->get_user_info = $get_user_info;
            $row->get_booking_info =  $get_booking_info;
            $row->get_bank_info =  $get_bank_info;
            $alltransaction[] = $row;
        }
        $company_info = DB::table('cms_settings')->where('status', 1)->where('id', 1)->first();
        $data = array('company_info' => $company_info, 'invoice' => $alltransaction);
        $pdf = PDF::loadView('company.invoice', $data);
        // return $pdf->download('invoice.pdf');
        return $pdf->stream('invoice.pdf');
    }

    public function sendNotificationToUser($fcm_token, $title, $body)
    {

        try {
            $factory = (new Factory)->withServiceAccount(storage_path('app/firebase/google-services.json'));
            
            $messaging = $factory->createMessaging();

            $message = CloudMessage::withTarget('token', $fcm_token)
                ->withNotification(Notification::create($title, $body))
                ->withData([
                    'title' => $title,
                    'body' => $body,
                    'click_action' => 'FLUTTER_NOTIFICATION_CLICK',
                    'priority' => 'high'
                ]);

            $messaging->send($message);

            return true;
        } catch (\Throwable $e) {
            return true;
        }
    }
}
