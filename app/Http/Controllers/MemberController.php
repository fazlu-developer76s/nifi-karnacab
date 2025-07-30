<?php

namespace App\Http\Controllers;

use DB;
use App\Models\Roles;
use App\Models\Member;
use App\Models\Route;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Svg\Tag\Rect;

class MemberController extends Controller
{

    public function index(Request $request , $type)
    {
        $title = "Member List";
        $query = DB::table('users');
        $query->leftJoin('roles', 'roles.id', '=', 'users.role_id');
        if($type){
            $query->where('users.role_id',$type);
        }
        if(isset($request->district_id) && $request->district_id != ""){
            $query->where('users.district',$request->district_id);
        }
        $query->where('users.role_id', '!=', 1)->where('users.status', '!=', 3)->select('users.*', 'roles.title')->orderBy('users.id', 'desc');
        $allmember = $query->get();
        
        return view('member.index', compact('title', 'allmember'));
    }

    public function approved_index()
    {

        $title = "Member List";
        $allmember = DB::table('users')->leftJoin('roles', 'roles.id', '=', 'users.role_id')->where('roles.id', 2)->where('users.is_user_verified', 1)->where('users.role_id', '!=', 1)->where('users.status', '!=', 3)->select('users.*', 'roles.title')->get();
        return view('member.index', compact('title', 'allmember'));
    }

    public function pending_index()
    {

        $title = "Member List";
        $is_user = 1;
        $allmember = DB::table('users')->leftJoin('roles', 'roles.id', '=', 'users.role_id')->where('roles.id', 2)->where('users.is_user_verified', 2)->where('users.role_id', '!=', 1)->where('users.status', '!=', 3)->select('users.*', 'roles.title')->get();
        return view('member.index', compact('title', 'allmember', 'is_user'));
    }

    public function member_kyc(Request $request)
    {
        $title = "KYC Member";

        // Base query
        $query = DB::table('kyc_processes')
            ->join('users', 'kyc_processes.user_id', '=', 'users.id')
            ->join('roles', 'roles.id', '=', 'users.role_id')
            ->where('users.status', 1)
            ->where('roles.status', 1)
            ->select(
                'users.name as user_name',
                'users.email as email',
                'users.mobile_no as mobile_no',
                'users.aadhar_no as aadhar_no',
                'roles.title as role_title',
                'kyc_processes.*'
            );

        // Add status filter if provided
        if ($request->filled('kyc_status')) {
            $query->where('kyc_processes.kyc_status', $request->input('kyc_status'));
        }
        if ($request->filled('from_date') && $request->filled('to_date')) {
            $query->where(function ($query) use ($request) {
                $query->where('kyc_processes.created_at', '>=', $request->input('from_date'))
                    ->where('kyc_processes.created_at', '<=', $request->input('to_date'));
            });
        }

        $allkyc = $query->get();

        return view('member.kyc_member', compact('title', 'allkyc'));
    }


    public function view_member_kyc($id)
    {

        $title = "KYC Member";
        $member = DB::table('kyc_processes')
            ->join('users', 'kyc_processes.user_id', '=', 'users.id')
            ->join('roles', 'roles.id', '=', 'users.role_id')
            ->where('users.status', 1)
            ->where('roles.status', 1)
            ->where('kyc_processes.id', $id)
            ->select('users.name as user_name', 'users.email as email', 'users.mobile_no as mobile_no', 'users.aadhar_no as aadhar_no', 'roles.title as role_title', 'kyc_processes.*')
            ->first();
        return view('member.view_kyc_member', compact('title', 'member'));
    }

    public function create(Request $request)
    {

        if ($request->method() == 'POST') {
            $request->validate([
                'name' => 'required|string|max:255',
                'role_id' => 'required',
                // 'gst_no' => 'required',
                // 'email' => [
                //     'required',
                //     'email',
                //     'regex:/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/'
                // ],
                'mobile_no' => [
                    'required',
                    'regex:/^[6-9]\d{9}$/'
                ],
                'status' => 'required',
                // 'password' => [
                //     'required',
                //     'string',

                // ],
            ]);
            $check_data =  $this->check_exist_data($request, null);
            if (!empty($check_data)) {
                if ($check_data->email == $request->email) {
                    $message = "Email Address";
                }
                if ($check_data->mobile_no == $request->mobile_no) {
                    $message = "Mobile No.";
                }
                if ($check_data) {
                    return redirect()->route('member.create')->with('error', '' . $message . ' Already Exists');
                }
            }
            $member = new Member();
            $member->name = $request->name;
            $member->role_id = $request->role_id;

            $member->email = $request->email;
            $member->mobile_no = $request->mobile_no;
            $member->status = $request->status;
            $member->password = Hash::make($request->password);

            $member->save();
            $insert_id = $member->id;
            return redirect()->route('member')->with('success', 'Member Added Successfully');
        }

        $title = "Add Member";
        $get_role = Roles::where('status', 1)->where('id', '!=', 1)->get();
        return view('member.create', compact('title', 'get_role'));
    }

    public function edit($id)
    {
        $title = "Edit Member";
        $get_member = Member::where('status', '!=', 3)->where('role_id', '!=', 1)->where('id', $id)->first();
        if ($get_member->role_id == 2) {
            $get_role = Roles::where('status', 1)->where('id', 2)->get();
        } else {
            $get_role = Roles::where('status', 1)->where('id', '!=', 2)->where('id', '!=', 1)->get();
        }
        return view('member.create', compact('title', 'get_member', 'get_role'));
    }

    public function view($id)
    {
     
        $title = "Edit Member";
        $get_user = DB::table('users as a')
            ->leftJoin('tbl_vehicle_image as b', 'a.id', '=', 'b.user_id')
            ->leftJoin('tbl_vehicle as c','c.id','=','a.car_id')
            ->leftJoin('tbl_state as d','d.id','=','a.ride_state')
            ->leftJoin('tbl_district as e','e.id','=','a.district')
            ->select('a.*', 'b.image as sub_image', 'b.type as image_type','c.title as car_name','d.title as state_name','e.title as district_name')
            ->where('a.id', $id)
            ->where('a.status', '!=', 3)
            ->get();
            // dd($get_user);
        return view('member.view', compact('title', 'get_user'));
    }

    public function update(Request $request)
    {
        // Validate the incoming request data
        $request->validate([
            'name' => 'required|string|max:255',
            'role_id' => 'required',
            // 'email' => [
            //     'required',
            //     'email',
            //     'regex:/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/'
            // ],
            'mobile_no' => [
                'required',
                'regex:/^[6-9]\d{9}$/'
            ],
            'status' => 'required',
        ]);

        // Check if the email, mobile number, or Aadhar number already exists
        $check_data = $this->check_exist_data($request, $request->hidden_id);

        // Prepare the error message if the data exists
        if ($check_data) {
            $message = '';

            if ($check_data->email == $request->email) {
                $message .= "Email Address ";
            }
            if ($check_data->mobile_no == $request->mobile_no) {
                $message .= "Mobile No. ";
            }

            // Redirect back with an error message if any data exists
            if ($message) {
                return redirect()->route('member.edit', ['id' => $request->hidden_id])
                    ->with('error', trim($message) . ' Already Exists');
            }
        }

        // Retrieve the member to update
        $member = Member::findOrFail($request->hidden_id);
        $member->name = $request->name;
        $member->role_id = $request->role_id;
        $member->email = $request->email;
        $member->mobile_no = $request->mobile_no;
        $member->status = $request->status;
        if ($request->gst_no) {
        }
        $member->save(); // Use save() to persist the changes

        // Redirect to the member list with a success message
        return redirect()->route('member')->with('success', 'Member Updated Successfully');
    }

    public function update_userstatus(Request $request)
    {
        // Validate request data
        $request->validate([
            'user_id' => 'required',
            'user_status' => 'required',
        ]);

        // Update user verification status
        DB::table('users')->where('id', $request->user_id)->update(['is_user_verified' => $request->user_status]);

        // Redirect with success message
        return redirect()->route('member.view', ['id' => $request->user_id])
                         ->with('success', 'Member Updated Successfully');
    }



    public function destroy($id)
    {

        // $member = Member::findOrFail($id);
        // $member->status = 3;
        // $member->update();
        DB::table('users')->where('id',$id)->delete();
        return redirect()->route('member')->with('success', 'Member deleted successfully.');
    }

    public function check_exist_data($request, $id)
    {
        $query = Member::where('status', '!=', 3);

        if ($id !== null) {
            $query->where('id', '!=', $id);
        }
        $check_member = $query->where(function ($q) use ($request) {
            $q->where('email', $request->email)
                ->orWhere('mobile_no', $request->mobile_no);
        })->first();

        return $check_member;
    }

    public function check_otp(Request $request)
    {
        $otp = $request->otp;
        $user_id = Auth::user()->id;
        $get_otp = DB::table('tbl_otp')
            ->where('user_id', $user_id)
            ->where('otp', $otp)
            ->where('status', 1)
            ->where('module_type', 3)
            ->where('otp_type', 2)
            ->first();

        if ($get_otp) {
            $update_otp_status = DB::table('tbl_otp')
                ->where('id', $get_otp->id)
                ->update(['status' => 2]);
        }

        if ($get_otp) {
            return response()->json(true);
        } else {
            return response()->json(false);
        }
    }

    public function update_kyc_status($id)
    {
        $update_kyc_status = DB::table('kyc_processes')->where('id', $id)->update(['kyc_status' => $_POST['kyc_status']]);
        if ($update_kyc_status) {
            return redirect()->route('view.member.kyc', $id)->with('success', 'Kyc Status Update successfully.');
        } else {
            return redirect()->route('view.member.kyc', $id)->with('errors', 'Error');
        }
    }
}
