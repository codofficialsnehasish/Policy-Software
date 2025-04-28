<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use App\Models\PolicysPayment;
use App\Models\PaymentMode;
use App\Models\Policyterm;
use App\Models\Customer;
use App\Models\Policy;

use Carbon\Carbon;
use Illuminate\Http\Request;

class PolicysPaymentController extends Controller
{
    public function index(Request $request)
    {
        $data['title'] = 'Policy Payment';
        if(!empty($request->start) && !empty($request->end)){
            $data['policy_payment'] = PolicysPayment::whereDate('payment_date', '>=', $request->start)
                                                    ->whereDate('payment_date', '<=', $request->end)->get();
        }else{
            $data['policy_payment'] = PolicysPayment::all();
        }
        return view('admin.bank_policy_payment.index')->with($data);
    }


    public function create()
    {
        $data['title'] = 'Policy Payment';
        $data['Policy'] = PaymentMode::all();
        $data['policies'] = Policyterm::all();
        $data['customers'] = Customer::all();
        return view('admin.bank_policy_payment.create')->with($data);
    }


    public function store(Request $request)
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

        $policy = new PolicysPayment();
        $policy->policy_number = $request->policy_no ?? 0;
        $policy->customer_id = $customer->id;
        $policy->amount = $request->amount;
        $policy->payment_mode = $request->payment_mode;
        $policy->refference_number = $request->refference_number;
        // $carbonDatetime = Carbon::parse($request->payment_date);
        // $policy->payment_date = $carbonDatetime->format('Y-m-d');
        $carbonDatetime = Carbon::createFromFormat('d M, Y', $request->payment_date); 
        $policy->payment_date = $carbonDatetime->format('Y-m-d');
        // $policy->acknowledgement_receipt = $request->acknowledgement_receipt;
        $policy->remarks = $request->remarks;
        $res = $policy->save();

        if ($res) {
            return redirect()->back()->with(['success' => 'Policy Payment Added Successfully']);
        } else {
            return redirect()->back()->with(['error' => 'There was an error adding the Policy Payment. Please try again!!']);
        }
    }

    public function show(PolicysPayment $policysPayment)
    {
        //
    }

    public function edit(string $id)
    {
        $data['title'] = 'Policy Payment';
        $data['Policy'] = PaymentMode::all();
        $data['policies'] = Policyterm::all();
        $data['customers'] = Customer::all();
        $policysPayment = PolicysPayment::find($id);
        $data['item'] = PolicysPayment::find($id);
        $data['policydata'] = Policy::where('customer_id',$policysPayment->customer_id)->get();
        return view('admin.bank_policy_payment.edit')->with($data);   
    }

    public function update(Request $request, string $id)
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

        $policy = PolicysPayment::find($id);
        $policy->policy_number = $request->policy_no ?? 0;
        $policy->customer_id = $customer->id;
        $policy->amount = $request->amount;
        $policy->payment_mode = $request->payment_mode;
        $policy->refference_number = $request->refference_number;
        // $carbonDatetime = Carbon::parse($request->payment_date);
        // $policy->payment_date = $carbonDatetime->format('Y-m-d');
        $carbonDatetime = Carbon::createFromFormat('d M, Y', $request->payment_date); 
        $policy->payment_date = $carbonDatetime->format('Y-m-d');
        // $policy->acknowledgement_receipt = $request->acknowledgement_receipt;
        $policy->remarks = $request->remarks;
        $res = $policy->update();

        if ($res) {
            return redirect()->back()->with(['success' => 'Policy Payment Updated Successfully']);
        } else {
            return redirect()->back()->with(['error' => 'There was an error Updating the Policy Payment. Please try again!!']);
        }
    }

    public function destroy(string $id)
    {
        $obj = PolicysPayment::find($id);
        $res = $obj->delete();

        if ($res) {
            return redirect()->back()->with(['success' => 'Policy Payment Deleted Successfully']);
        } else {
            return redirect()->back()->with(['error' => 'There was an deleting the Policy Payment. Please try again!!']);
        }

    }

    public function receipt($id)
    {
        $data['title'] = 'Policy Payment';
        $obj = PolicysPayment::find($id);
        if (!$obj) {
            return redirect()->back()->with(['error' => 'Invalid Policy Payment Mode. Please input  Correct Policy Payment Mode !!']);
        }
        $customer = $obj->customer_id;
        $policy_id = $obj->policy_id;
        $data['Policy'] = PaymentMode::all();

        $data['policies'] = Policyterm::all();
        $data['customer_name'] = Customer::where('id', $customer)->value('name');
        $data['customer_id'] = Customer::where('id', $customer)->value('customer_id');
        
            $data['statements'][] = [
                'date' => $obj->payment_date,
                'narration' => $obj->remarks,
                'debit' => $obj->amount,
                'credit' => 0,
                'closing_balance' => $obj->amount
            ];
        
        $data['receipt_number'] = sprintf('%05d', $obj->id);
        return view("admin/policy_payment/new-receipt")->with($data);
    }
}
