<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PaymentMode;
class PolicyPaymentModeController extends Controller
{
    public function index(){
        $data['title'] = 'Policy Payment Mode';
        $data['policy'] = PaymentMode::all();
        return view("admin/policy_master/policy_payment/content")->with($data);
    }

    public function add(){
        $data['title'] = 'Add Policy Payment Mode';
        return view("admin/policy_master/policy_payment/add")->with($data);
    }

    public function process(Request $request){

        $request->validate([
            'name' => 'required|string|max:255',
            // 'title' =>'required|string|max:255',
            'is_visible' => 'boolean',
        ]);
        $policy = new PaymentMode();
        $policy->name=$request->name;
        $policy->title=$request->title;
        $policy->visibility=$request->is_visible;
        $res = $policy->save();

        if($res){
            return redirect()->route('payment')->with(['success'=>'Policy Payment Mode Added Successfully']);
        }else{
            return redirect()->back()->with(['error'=>'There was an error adding the Policy Payment Mode. Please try again!!']);
        }
    }

    public function edit($id){
        $data['title'] = 'Edit PaymentMode Master';
        $data['policy'] = PaymentMode::find($id);

        // if (!$policy) {
        //     return redirect()->route('frequency.policy')->with('error', 'policy not found.');
        // }
        // return view("admin/customer/edit")->with($data);
        return view("admin/policy_master/policy_payment/edit")->with($data);

    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            // 'title' =>'required|string|max:255',
            'is_visible' => 'boolean',
        ]);


        $policy =  PaymentMode::find($id);

        if (!$policy ) {
            return redirect()->route('payment')->with('error', 'Policy Payment Mode not found.');
        }
        $policy->name=$request->name;
        $policy->title=$request->title;
        $policy->visibility=$request->is_visible;

        if ($policy->update()) {
            return redirect()->route('payment')->with('success', 'Policy Payment Mode updated successfully.');
        } else {
            return redirect()->back()->with('error', 'There was an error updating the Policy Payment Mode. Please try again.');
        }
    }

    public function delete($id)
    {
        $policy =  PaymentMode::find($id);

        if (!$policy ) {
            return redirect()->route('payment')->with('error', 'Policy Payment Mode payment not found.');
        }

        if ($policy->delete()) {
            return redirect()->route('payment')->with('success', 'Policy Payment Mode deleted successfully.');
        } else {
            return redirect()->route('payment')->with('error', 'There was an error deleting the Policy Payment Mode. Please try again.');
        }
    }
}
