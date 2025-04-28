<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\FrequancyPolicy;
class FrequancyController extends Controller
{
    public function index(){
        $data['title'] = 'Policy Frequancy Master';
        $data['policy'] =FrequancyPolicy::all();
        return view("admin/policy_master/policy_frequency/content")->with($data);
    }

    public function add(){
        $data['title'] = 'Add Policy Frequancy';
        return view("admin/policy_master/policy_frequency/add")->with($data);
    }

    public function process(Request $request){

        $request->validate([
            // 'name' => 'required|string|max:255',
            'name' =>'required|string|max:255',
            'is_visible' => 'boolean',
        ]);
        $policy = new FrequancyPolicy();
        $policy->name=$request->name;
        $policy->title=$request->title;
        $policy->visibility=$request->is_visible;
        $res = $policy->save();

        if($res){
            return redirect()->route('frequency.policy')->with(['success'=>'Policy Frequancy Added Successfully']);
        }else{
            return redirect()->back()->with(['error'=>'There was an error adding the Policy Frequancy. Please try again!!']);
        }
    }

    public function edit($id){
        $data['title'] = 'Edit Policy Frequancy';
        $data['policy'] = FrequancyPolicy::find($id);

        // if (!$policy) {
        //     return redirect()->route('frequency.policy')->with('error', 'policy not found.');
        // }
        // return view("admin/customer/edit")->with($data);
        return view("admin/policy_master/policy_frequency/edit")->with($data);

    }

    public function update(Request $request, $id)
    {
        $request->validate([
            // 'name' => 'required|string|max:255',
            'name' =>'required|string|max:255',
            'is_visible' => 'boolean',
        ]);


        $policy =  FrequancyPolicy::find($id);

        if (!$policy ) {
            return redirect()->route('frequency.policy')->with('error', 'Policy Frequancy not found.');
        }
        $policy->name=$request->name;
        $policy->title=$request->title;
        $policy->visibility=$request->is_visible;

        if ($policy->update()) {
            return redirect()->route('frequency.policy')->with('success', 'Policy Frequancy updated successfully.');
        } else {
            return redirect()->back()->with('error', 'There was an error updating the Policy Frequancy. Please try again.');
        }
    }

    public function delete($id)
    {
        $policy =  FrequancyPolicy::find($id);

        if (!$policy ) {
            return redirect()->route('frequency.policy')->with('error', 'Policy Frequancy not found.');
        }

        if ($policy->delete()) {
            return redirect()->route('frequency.policy')->with('success', 'Policy Frequancy deleted successfully.');
        } else {
            return redirect()->route('frequency.policy')->with('error', 'There was an error deleting the policy. Please try again.');
        }
    }
}
