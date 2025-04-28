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
use App\Models\Policytype;
class PolicyController extends Controller
{
    public function index(){
        $data['title'] = 'Policy';
        $data['policy'] =Policy::all();

        // $data['policy'] = Policy::all();
        return view("admin/policy/content")->with($data);
    }

    public function add(){
        $data['title'] = 'Policy';
        $data['Policy'] = Policytype::all();
        $data['Policyterm'] = Policyterm::all();
        $data['customer'] = Customer::all();
        $data['FrequancyPolicy'] = FrequancyPolicy::all();
        return view("admin/policy/add")->with($data);
    }

    public function process(Request $request)
    {
        $request->validate([
            'policy_type' => 'required|string',
            'sum_assured' => 'required|numeric',
            'policy_term' => 'required|string',
            'maturity_date' => 'required|date_format:"d M, Y"',
            'nominee_name' => 'required|string|max:255',
            'nominee_relationship' => 'required|string|max:255',
            'nominee_contact_number' => 'required|digits:10|starts_with:6,7,8,9',
            // 'policy_no' => 'required|integer',
            'policy_no' => 'required|string',
            'customer_id' => 'required|integer',
            // 'policy_no' => 'required|integer',
            'premium_amount' => 'required|numeric',
            'frequency' => 'required|string',
            'due_date' => 'required|date_format:"d M, Y"',
            'status' => 'required|string|max:255',
        ]);




        $policy = new Policy();
        $policy->policy_no  =$request->policy_no;

        $policy->policy_type = $request->policy_type;
        $policy->sum_assured = $request->sum_assured;
        $policy->policy_term = $request->policy_term;
        $policy->maturity_date = $request->maturity_date;
        $policy->nominee_name = $request->nominee_name;
        $policy->nominee_relationship = $request->nominee_relationship;
        $policy->nominee_contact_number = $request->nominee_contact_number;

        $customer = Customer::where('id', $request->customer_id)->first();
        if (!$customer) {
            return redirect()->back()->with(['error' => 'Invalid Customer ID. Please input  Correct Customer ID!!']);
        }
        $policy->customer_id = $customer->id;
        $policy->premium_amount = $request->premium_amount;
        $policy->frequency = $request->frequency;
        $policy->due_date = $request->due_date;
        $policy->status = $request->status;
        $res = $policy->save();

        if ($res) {
            return redirect()->route('policy')->with(['success' => ' Policy Added Successfully']);
        } else {
            return redirect()->back()->with(['error' => 'There was an error adding the Policy. Please try again!!']);
        }
    }

    public function edit($id){
        $data['title'] = 'Edit Policy';
        $data['policy'] =  Policy::find($id);
        $data['Policyterm'] = Policyterm::all();

        $data['customer'] = Customer::all();
        $data['FrequancyPolicy'] = FrequancyPolicy::all();
        $data['Policytype'] = Policytype::all();
        // if (!$policy) {
        //     return redirect()->route('frequency.policy')->with('error', 'policy not found.');
        // }
        // return view("admin/customer/edit")->with($data);
        return view("admin/policy/edit")->with($data);

    }
    public function update(Request $request, $id)
    {
        $request->validate([
            'policy_type' => 'required|string',
            'sum_assured' => 'required|numeric',
            'policy_term' => 'required|string',
            'maturity_date' => 'required|date_format:"d M, Y"',
            'nominee_name' => 'required|string|max:255',
            'nominee_relationship' => 'required|string|max:255',
            'nominee_contact_number' => 'required|digits:10|starts_with:6,7,8,9',
            // 'policy_no' => 'required|integer',
            'policy_no' => 'required|string',

            'customer_id' => 'required|integer',
            // 'policy_no' => 'required|integer',
            'premium_amount' => 'required|numeric',
            'frequency' => 'required|string',
            'due_date' => 'required|date_format:"d M, Y"',
            // 'status' => 'required|string|max:255',
        ]);



        $policy = Policy::find($id);
        $policy->policy_no  =$request->policy_no;
        $policy->policy_type = $request->policy_type;
        $policy->sum_assured = $request->sum_assured;
        $policy->policy_term = $request->policy_term;
        $policy->maturity_date = $request->maturity_date;
        $policy->nominee_name = $request->nominee_name;
        $policy->nominee_relationship = $request->nominee_relationship;
        $policy->nominee_contact_number = $request->nominee_contact_number;

        $customer = Customer::where('id', $request->customer_id)->first();
        if (!$customer) {
            return redirect()->back()->with(['error' => 'Invalid Customer ID. Please input  Correct Customer ID!!']);
        }

        $policy->customer_id = $customer->id;
        $policy->premium_amount = $request->premium_amount;
        $policy->frequency = $request->frequency;
        $policy->due_date = $request->due_date;
        $policy->status = $request->status;
        $res = $policy->update();

        if ($res) {
            return redirect()->route('policy')->with(['success' => ' Policy Updated Successfully']);
        } else {
            return redirect()->back()->with(['error' => 'There was an error adding the Policy. Please try again!!']);
        }
    }

    public function delete($id)
    {
        $policy = Policy::find($id);

        if (!$policy ) {
            return redirect()->route('policy')->with('error', 'Policy not found.');
        }

        if ($policy->delete()) {
            return redirect()->route('policy')->with('success', 'policy deleted successfully.');
        } else {
            return redirect()->route('policy')->with('error', 'There was an error deleting the policy. Please try again.');
        }
    }
}
