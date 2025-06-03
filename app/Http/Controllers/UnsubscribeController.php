<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;
use App\Models\Loan_request;
use App\Models\Member;
use App\Helpers\Global_helper as GlobalHelper;
use Illuminate\Support\Facades\Auth;
use Laravel\Ui\Presets\React;
use App\Models\Providers;
use App\Models\Route;
use App\Models\User;
use Carbon\Carbon;

class UnsubscribeController extends Controller
{

    public function index(Request $request)
    {
        if ($request->isMethod('post')) {
            if(isset($request->type) && $request->type == "delete_account"){
                $validated = $request->validate([
                    'mobile_no' => [
                        'required',
                        'regex:/^[6-9][0-9]{9}$/',
                    ],
                    'otp' => [
                        'required',
                        'integer',
                        'digits:4',
                    ]
                ]);
                $getOTP = DB::table('tbl_otp')
                    ->where('field_value', $request->mobile_no)
                    ->where('status', 1)
                    ->where('module_type', 4)
                    ->where('otp', $request->otp)
                    ->orderBy('id', 'desc')
                    ->first();
                if (!$getOTP) {
                    return redirect()->route('unsubscribe',['mobile_no' => $request->mobile_no])->with('error', 'Invalid OTP. Please Enter OTP');
                } else {
                    $current_time = Carbon::now();
                    $otpTime = Carbon::parse($getOTP->created_at);
                    if ($current_time->diffInMinutes($otpTime) > 10) {
                        return response()->json([
                            'status' => "Error",
                            'message' => "OTP is expired",
                            'data' => $request->all()
                        ], 401);
                    }
                    DB::table('users')
                    ->where('mobile_no', $request->mobile_no)
                    ->update(['status' => 3]);
                    $this->ExpireOTP($getOTP->id);
                    return redirect()->route('unsubscribe')->with('success', 'Account deleted successfully');
                }
                return response()->json(['error' => 'Invalid credentials'], 401);
            }else{
                $validated = $request->validate([
                    'mobile_no' => [
                        'required',
                        'regex:/^[6-9][0-9]{9}$/',
                    ]
                ]);
                $check_user = DB::table('users')->where('mobile_no', $request->mobile_no)->first();
                if($check_user->status !=3 && $check_user->status !=4){
                    if ($otp = $this->userOTP($request->mobile_no)) {
                        $this->GenerateOTP($otp, $request->mobile_no);
                        return redirect()->route('unsubscribe', ['mobile_no' => $request->mobile_no])->with('success', 'OTP Sent Successfully');
                    }
                }
                if(empty($check_user) ||  $check_user->status ==3 || $check_user->status == 4){
                    return redirect()->route('unsubscribe')->with('error', 'Account Not Found');
                }
                return redirect()->route('unsubscribe')->with('error', 'Something Went Wrong');
            }
        }
        $title = "Delete Account";
        return view('unsubscribe.index', compact('title'));
    }

    public function userOTP($mobile_no)
    {
        $entity_id = 1701159540601889654;
        $senderId  = "NRSOFT";
        $temp_id   = "1707164805234023036";
        $userid = "NERASOFT1";
        $otp = rand(1000, 9999);
        $request = "Login Request";
        $password = 111321;
        $temp = "Dear User Your OTP For Login in sixcash is $otp Valid For 10 Minutes. we request you to don't share with anyone .Thanks NSAFPL";
        $url = 'http://sms.nerasoft.in/api/SmsApi/SendSingleApi?' . http_build_query([
            'UserID'    => $userid,
            'Password'  => $password,
            'SenderID'  => $senderId,
            'Phno'      => $mobile_no,
            'Msg'       => $temp,
            'EntityID'  => $entity_id,
            'TemplateID' => $temp_id
        ]);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $headers = [
            'Content-Type: application/json',
            'Content-Length: 0'
        ];
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        $response = curl_exec($ch);
        if ($response === false) {
            $error = curl_error($ch);
            curl_close($ch);
            return "Error: $error";
        }
        curl_close($ch);
        return $otp;
    }

    public function GenerateOTP($otp, $mobile_no)
    {
        $genrateOTP = DB::table('tbl_otp')->insert([
            'otp' => $otp,
            'module_type' => 4,
            'field_value' => $mobile_no,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        if ($genrateOTP) {
            return true;
        }
    }
    public function ExpireOTP($id)
    {
        $expireOTP = DB::table('tbl_otp')
            ->where('id', $id)
            ->where('status', 1)
            ->where('module_type', 4)
            ->where('otp_type', 1)
            ->update(['status' => 2]);
        if ($expireOTP) {
            return true;
        }
    }

}
