<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;
use App\Models\Policyterm;
use App\Models\FrequancyPolicy;
use App\Models\Customer;
use App\Models\Policy;
use App\Models\User;
use App\Models\PolicyPaymentMode;
use App\Models\PaymentMode;
use App\Models\General_settings;
use Barryvdh\DomPDF\Facade\PDF;
// use PDF;

class PaymentController extends Controller
{
    public function index()
    {
        $data['title'] = 'Policy';
        $data['policyPaymentModes'] =  PolicyPaymentMode::all();
        //  $data['policyPaymentModes'] = PolicyPaymentMode::with('policy', 'customer')->latest()->paginate(10);
        return view("admin/policy_payment/content")->with($data);
    }

    public function add()
    {
        $data['title'] = 'Policy';
        $data['Policy'] = PaymentMode::all();
        $data['policies'] = Policyterm::all();
        $data['customers'] = Customer::all();
        return view("admin/policy_payment/add")->with($data);
    }

    public function get_policy_by_customer(Request $r){
        if(Customer::where('id',$r->id)->exists()){
            $policys = Policy::where('customer_id',$r->id)->get();
            return json_encode($policys);
        }else{
            return json_encode('Customer Not found');
        }
    }

    public function receipt($id)
    {
        $data['title'] = 'Policy Payment';
        $obj = PolicyPaymentMode::find($id);
        if (!$obj) {
            return redirect()->back()->with(['error' => 'Invalid Policy Payment Mode. Please input  Correct Policy Payment Mode !!']);
        }
        $customer = $obj->customer_id;
        $policy_id = $obj->policy_id;
        $data['Policy'] = PaymentMode::all();
        $data['General_settings'] = General_settings::all();
        $data['policies'] = Policyterm::all();
        $data['customer_name'] = Customer::where('id', $customer)->value('name');
        $data['customer_id'] = Customer::where('id', $customer)->value('customer_id');
        
            $data['statements'][] = [
                'date' => $obj->payment_date,
                'narration' => $obj->remarks,
                'debit' => 0,
                'credit' => $obj->amount,
                'closing_balance' => $obj->amount
            ];
        
        $data['receipt_number'] = sprintf('%05d', $obj->id);
        return view("admin/policy_payment/new-receipt")->with($data);
    }

    

    public function download($id)
    {
        $data['title'] = 'Policy Payment';
        $obj = PolicyPaymentMode::find($id);
        if (!$obj) {
            return redirect()->back()->with(['error' => 'Invalid Policy Payment Mode. Please input Correct Policy Payment Mode !!']);
        }
        $customer = $obj->customer_id;
        $policy_id = $obj->policy_id;
        $data['Policy'] = PaymentMode::all();
        $data['General_settings'] = General_settings::all();
        $data['policies'] = Policyterm::all();
        $data['customers'] = Customer::find($customer);
        $data['policyPaymentMode'] = $obj;
        $data['receipt_number'] = sprintf('%05d', $obj->id);

        $filename = 'receipt_' . time() . '.pdf';
        $pdf = PDF::loadView('admin.policy_payment.Receipt', $data);
        return $pdf->download($filename);
        // return $pdf->download('admin.policy_payment.Receipt' . $obj->id . '.pdf');
        // return $pdf->download('document.pdf');
        //     return response($pdf->output(), 200)
        //       ->header('Content-Type', 'application/pdf')
        //                ->header('Content-Disposition', 'inline; filename="report.pdf"');
    }

//     public function download_ticket(Request $r)
//     {
//         ini_set('max_execution_time', 120);
//         ini_set('memory_limit', '256M');

//         $ticket = Ticket::where('ticket_no',$r->ticket_number)->first();
//         $cartDataCollection = Game_carts::where('ticket_id', '=', $ticket->id)
//                         ->get();
//         $data['ticket'] = $ticket;
//         $data['cartdata'] = $cartDataCollection;
//         $pdf = PDF::loadView('admin.game.ticket',$data);

//         // $filePath = public_path('documents/ticket.pdf');
//         // file_put_contents($filePath, $pdf->output());

//         // return $pdf->download('document.pdf');
//         // return response($pdf->output(), 200)
//         //         ->header('Content-Type', 'application/pdf')
//         //         ->header('Content-Disposition', 'inline; filename="ticket.pdf"');
//     }

// public function generateTicket(Request $r,$id)
//     {
//         ini_set('max_execution_time', 120);
//         ini_set('memory_limit', '256M');
//         $obj = PolicyPaymentMode::find($id);

//         // $ticket = Ticket::find($r->ticket_id);
//         $url = route('download-ticket', $id);
//         return  $url ;
//         // $cartDataCollection = Game_carts::where('ticket_id', '=', $ticket->id)
//         //                 ->get();
//         // $data['ticket'] = $ticket;
//         // $data['cartdata'] = $cartDataCollection;
//         // $pdf = PDF::loadView('admin.game.ticket',$data);

//         // $filePath = public_path('documents/ticket.pdf');
//         // file_put_contents($filePath, $pdf->output());

//         // return $pdf->download('document.pdf');
//         // return response($pdf->output(), 200)
//         //         ->header('Content-Type', 'application/pdf')
//         //         ->header('Content-Disposition', 'inline; filename="ticket.pdf"');
//     }



    public function process(Request $request)
    {
        $request->validate([
            // 'policy_no' => 'required',
            'customer_id' => 'required|exists:customers,id',
            'amount' => 'required|numeric',
            'payment_mode' => 'required',
            // 'acknowledgement_receipt' => 'required|string|max:255',
            'remarks' => 'nullable|string|max:255',
        ]);

        // $customer = Policyterm::where('id', $request->policy_no)->first();
        // if (!$customer) {
        //     return redirect()->back()->with(['error' => 'Invalid Policy No. Please input  Correct Policy No!!']);
        // }

        $customer = Customer::where('id', $request->customer_id)->first();
        if (!$customer) {
            return redirect()->back()->with(['error' => 'Invalid Customer ID. Please input  Correct Customer ID!!']);
        }

        $policy = new PolicyPaymentMode();
        $policy->policy_number = $request->policy_no ?? 0;
        $policy->customer_id = $customer->id;
        $policy->amount = $request->amount;
        $policy->payment_mode = $request->payment_mode;
        $policy->refference_number = $request->refference_number;

        if(isset($request->payment_date)){
            $carbonDatetime = Carbon::createFromFormat('d M, Y', $request->payment_date); 
            $policy->payment_date = $carbonDatetime->format('Y-m-d');
        }else{
            $policy->payment_date = date('Y-m-d');
        }
        // dd($policy->payment_date); die;
        // $policy->acknowledgement_receipt = $request->acknowledgement_receipt;
        $policy->remarks = $request->remarks;
        $res = $policy->save();

        if ($res) {
            return redirect()->route('policy-payment')->with(['success' => 'Policy Payment Added Successfully']);
        } else {
            return redirect()->back()->with(['error' => 'There was an error adding the Policy Payment. Please try again!!']);
        }
    }

    public function edit($id)
    {
        $data['title'] = 'Edit Policyterm';
        $policypaymode =  PolicyPaymentMode::find($id);
        $data['policyPaymentMode'] = $policypaymode;
        $data['policies'] = Policyterm::all();
        $data['PaymentMode'] = PaymentMode::all();
        $data['customers'] = Customer::all();
        $data['policydata'] = Policy::where('customer_id',$policypaymode->customer_id)->get();
        // if (!$policy) {$policyPaymentMode = PolicyPaymentMode::findOrFail($id);
        // $policyPaymentMode->delete();
        //     return redirect()->route('frequency.policy')->with('error', 'policy not found.');
        // }
        // return view("admin/customer/edit")->with($data);
        return view("admin/policy_payment/edit")->with($data);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            // 'policy_no' => 'required',
            'customer_id' => 'required|exists:customers,id',
            'amount' => 'required|numeric',
            'payment_mode' => 'required',
            // 'acknowledgement_receipt' => 'required|string|max:255',
            'remarks' => 'nullable|string|max:255',
        ]);

        // $customer = Policyterm::where('id', $request->policy_no)->first();
        // if (!$customer) {
        //     return redirect()->back()->with(['error' => 'Invalid Policy No. Please input  Correct Policy No!!']);
        // }

        $customer = Customer::where('id', $request->customer_id)->first();
        if (!$customer) {
            return redirect()->back()->with(['error' => 'Invalid Customer ID. Please input  Correct Customer ID!!']);
        }



        $policy = PolicyPaymentMode::find($id);
        $policy->policy_number = $request->policy_no ?? 0;
        $policy->customer_id = $customer->id;
        $policy->amount = $request->amount;
        $policy->payment_mode = $request->payment_mode;
        $policy->refference_number = $request->refference_number;
        $carbonDatetime = Carbon::createFromFormat('d M, Y', $request->payment_date); // Specify the format
        $policy->payment_date = $carbonDatetime->format('Y-m-d');
        // $carbonDatetime = Carbon::parse($request->payment_date);
        // $policy->payment_date = $carbonDatetime->format('Y-m-d');
        // $policy->acknowledgement_receipt = $request->acknowledgement_receipt;
        $policy->remarks = $request->remarks;

        $res = $policy->update();

        if ($res) {
            return redirect()->route('policy-payment')->with(['success' => ' Policy Payment Updated Successfully']);
        } else {
            return redirect()->back()->with(['error' => 'There was an error adding the Policy Payment. Please try again!!']);
        }
    }

    public function delete($id)
    {
        $policy = PolicyPaymentMode::find($id);

        if (!$policy) {
            return redirect()->route('policy-payment')->with('error', 'Policy Payment not found.');
        }

        if ($policy->delete()) {
            return redirect()->route('policy-payment')->with('success', 'Policy Payment deleted successfully.');
        } else {
            return redirect()->route('policy-payment')->with('error', 'There was an error deleting the Policy Payment. Please try again.');
        }
    }
}
