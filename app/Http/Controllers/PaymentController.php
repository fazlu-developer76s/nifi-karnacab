<?php

namespace App\Http\Controllers;


use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;


use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\Payment;

class PaymentController extends Controller
{
       public function fetch_payment(Request $request)
    {
        // Step 1: Validate inputs
        $validator = Validator::make($request->all(), [
            'txnid' => 'required|string',
            'booking_id' => 'required|integer',
        ]);
    
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()->first()], 422);
        }
    
        $txnid = trim($request->txnid);
        $bookingId = $request->booking_id;
    
        // Fallback for authenticated user
        $userId = $request->user->id ?? 10;
    
        $key = env('PAYU_MERCHANT_KEY');
        $salt = env('PAYU_MERCHANT_SALT');
        $command = 'verify_payment';
    
        $hashString = $key . '|' . $command . '|' . $txnid . '|' . $salt;
        $hash = strtolower(hash('sha512', $hashString));
    
        $payload = [
            'key' => $key,
            'command' => $command,
            'var1' => $txnid,
            'hash' => $hash,
        ];
    
        $url = env('PAYU_BASE_URL', 'https://test.payu.in/merchant/postservice.php?form=2');
    
        try {
            $response = Http::asForm()->post($url, $payload);
    
            if ($response->successful()) {
                $data = $response->json();
                $txnDetails = $data['transaction_details'][$txnid] ?? null;
    
                if ($txnDetails && isset($txnDetails['status'])) {
                    // Optional: Avoid duplicate entry by checking if txn already exists
                    $existing = DB::table('payments')->where('transaction_id', $txnid)->exists();
                    if ($existing) {
                        return response()->json([
                            'message' => 'Transaction already recorded',
                            'transaction' => $txnDetails,
                        ]);
                    }
    
                    // Insert transaction into DB
                    DB::table('payments')->insert([
                        'booking_id'     => $bookingId,
                        'user_id'        => $userId,
                        'status'         => $txnDetails['status'] ?? 'unknown',
                        'payment_mode'   => $txnDetails['mode'] ?? null,
                        'payment_type' => 'debit',
                        'type' => 'payu',
                        'amount'         => $txnDetails['transaction_amount'] ?? 0,
                        'transaction_id' => $txnDetails['txnid'] ?? $txnid,
                        'response'       => json_encode($txnDetails),
                        'created_at'     => now(),
                        'updated_at'     => now(),
                    ]);
                    if(isset($txnDetails['status']) && $txnDetails['status'] =="success"){
                    DB::table('tbl_booking')->where('id',$bookingId)->update(['payment_status' => $txnDetails['status'] ?? 'unknown' ]);
                    }
    
                    return response()->json([
                        'message' => 'Transaction verified and recorded successfully',
                        'transaction' => $txnDetails,
                    ]);
                }
    
                return response()->json([
                    'error' => 'Transaction details not found for this txnid',
                    'response' => $data,
                ], 404);
            }
    
            return response()->json([
                'error' => 'Failed to verify transaction',
                'status_code' => $response->status(),
                'response' => $response->body(),
            ], 500);
    
        } catch (\Exception $e) {
            Log::error('PayU fetch_payment exception', ['message' => $e->getMessage()]);
            return response()->json([
                'error' => 'Exception occurred while verifying transaction',
                'message' => $e->getMessage(),
            ], 500);
        }
    }
    
    
    public function fetch_transaction(Request $request){
            
            $get_transaction = DB::table('payments')->where('user_id',$request->user->id)->orderBy('id','desc')->get();
            return response()->json(['status'=>'OK','message'=>'Transaction fetched successfully','data'=>$get_transaction]);
        
    }
    
    public function callback(Request $request){
         // Step 1: Validate inputs
        $validator = Validator::make($request->all(), [
            'txnid' => 'required|string'
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()->first()], 422);
        }
        $txnid = trim($request->txnid);
        $key = env('PAYU_MERCHANT_KEY');
        $salt = env('PAYU_MERCHANT_SALT');
        $command = 'verify_payment';
        // Step 2: Create hash string
        $hashString = $key . '|' . $command . '|' . $txnid . '|' . $salt;
        $hash = strtolower(hash('sha512', $hashString));
        $payload = [
            'key' => $key,
            'command' => $command,
            'var1' => $txnid,
            'hash' => $hash,
        ];
        $url = env('PAYU_BASE_URL', 'https://test.payu.in/merchant/postservice.php?form=2');
        try {
            $response = Http::asForm()->post($url, $payload);
            if ($response->successful()) {
                $data = $response->json();
                if (!isset($data['transaction_details'][$txnid])) {
                    return response()->json([
                        'error' => 'Transaction details not found for this txnid',
                        'response' => $data,
                    ], 404);
                }
                $txnDetails = $data['transaction_details'][$txnid];

                // Insert or update payment (your logic can vary here)
             $updated = DB::table('payments')
                    ->where('transaction_id', $txnid)
                    ->update([
                        'txnid' => $txnDetails['txnid'] ?? $txnid,
                        'status' => $txnDetails['status'] ?? 'unknown',
                        'response' => json_encode($txnDetails),
                        'updated_at' => now(),
                    ]);

                $get_txn = DB::table('payments')->where('transaction_id', $txnid)->first();
                // Update booking table if payment is successful
                if (isset($txnDetails['status']) && $txnDetails['status'] === "success") {
                    DB::table('tbl_booking')
                        ->where('id', $get_txn->booking_id ?? 0)
                        ->update(['payment_status' => $txnDetails['status']]);
                }
                return response()->json([
                    'message' => 'Transaction verified and recorded successfully',
                    'transaction' => $txnDetails,
                ]);
            }
            // Fallback: if response is not 2xx
            return response()->json([
                'error' => 'Failed to verify transaction',
                'status_code' => $response->status(),
                'response' => $response->body(),
            ], 500);
        } catch (\Exception $e) {
            Log::error('PayU fetch_payment exception', ['message' => $e->getMessage()]);
            return response()->json([
                'error' => 'Exception occurred while verifying transaction',
                'message' => $e->getMessage(),
            ], 500);
        }
    }
   
}
