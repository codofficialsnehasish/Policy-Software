<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Policyterm;
use App\Models\FrequancyPolicy;
use App\Models\Customer;
use App\Models\Policy;

class PolicytermsController extends Controller
{
    public function index()
    {
        $data['title'] = 'Policyterm';
        $data['policy'] = Policyterm::all();
        return view("admin/polocy_terms/content")->with($data);
    }

    public function add()
    {
        $data['title'] = 'Add new Policyterm';
        $data['policy'] = FrequancyPolicy::all();
        $data['customer'] = Customer::all();
        return view("admin/polocy_terms/add")->with($data);
    }

    public function process(Request $request)
    {
        $request->validate([
            'customer_id' => 'required|integer',
            // 'policy_no' => 'required|integer',
            'premium_amount' => 'required|numeric',
            'frequency' => 'required|string',
            'due_date' => 'required|date_format:"d M, Y"',
            'status' => 'required|string|max:255',
        ]);
        // $policy_no = Policy::where('id', $request->policy_no)->first();
        // if (!$policy_no) {
        //     return redirect()->back()->with(['error' => 'Invalid policy_no. Please input  Correct policy_no!!']);
        // }
        $customer = Customer::where('id', $request->customer_id)->first();
        if (!$customer) {
            return redirect()->back()->with(['error' => 'Invalid Customer ID. Please input  Correct Customer ID!!']);
        }
        $policy = new Policyterm();
        // $policy->policy_no = $policy_no->id;
        $policy->customer_id = $customer->id;
        $policy->premium_amount = $request->premium_amount;
        $policy->frequency = $request->frequency;
        $policy->due_date = $request->due_date;
        $policy->status = $request->status;
        $res = $policy->save();

        if ($res) {
            return redirect()->route('policy-terms.index')->with(['success' => ' Policy Term Added Successfully']);
        } else {
            return redirect()->back()->with(['error' => 'There was an error adding the Policy Term. Please try again!!']);
        }
    }

    public function edit($id){
        $data['title'] = 'Edit Policyterm';
        $data['policy_term'] =  Policyterm::find($id);
        $data['policy'] = FrequancyPolicy::all();
        // if (!$policy) {
        //     return redirect()->route('frequency.policy')->with('error', 'policy not found.');
        // }
        // return view("admin/customer/edit")->with($data);
        return view("admin/polocy_terms/edit")->with($data);

    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'customer_id' => 'required|integer',
            'premium_amount' => 'required|numeric',
            'frequency' => 'required|string',
            'due_date' => 'required|date_format:"d M, Y"',
            'status' => 'required|string|max:255',
        ]);

        $customer = Customer::where('id', $request->customer_id)->first();
        if (!$customer) {
            return redirect()->back()->with(['error' => 'Invalid Customer ID. Please input  Correct Customer ID!!']);
        }
        $policy = Policyterm::find($id);
        $policy->customer_id = $customer->id;
        $policy->premium_amount = $request->premium_amount;
        $policy->frequency = $request->frequency;
        $policy->due_date = $request->due_date;
        $policy->status = $request->status;
        $res = $policy->update();

        if ($res) {
            return redirect()->route('policy-terms.index')->with(['success' => ' Policy Term Updated Successfully']);
        } else {
            return redirect()->back()->with(['error' => 'There was an error adding the Policy Term. Please try again!!']);
        }
    }
    public function delete($id)
    {
        $policy = Policyterm::find($id);

        if (!$policy ) {
            return redirect()->route('policy-terms.index')->with('error', 'Policy-term not found.');
        }

        if ($policy->delete()) {
            return redirect()->route('policy-terms.index')->with('success', 'policy-term deleted successfully.');
        } else {
            return redirect()->route('policy-terms.index')->with('error', 'There was an error deleting the policy-term. Please try again.');
        }
    }
}
