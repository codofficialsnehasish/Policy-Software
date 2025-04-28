<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Policytype;
class PolicytypeController extends Controller
{
    public function index(){
        $data['title'] = 'Policy Types';
        $data['policy'] = Policytype::all();
        return view("admin/policy_master/policy_type/content")->with($data);
    }

    public function add(){
        $data['title'] = 'Add Policy Types';
        return view("admin/policy_master/policy_type/add")->with($data);
    }

    public function process(Request $request){

        $request->validate([
            'name' => 'required|string|max:255',
            // 'title' =>'required|string|max:255',
            'is_visible' => 'boolean',
        ]);
        $policy = new Policytype();
        $policy->name=$request->name;
        $policy->title=$request->title;
        $policy->visibility=$request->is_visible;
        $res = $policy->save();

        if($res){
            return redirect()->route('policy-type')->with(['success'=>'Policy Type Added Successfully']);
        }else{
            return redirect()->back()->with(['error'=>'There was an error adding the Policy policy-type. Please try again!!']);
        }
    }

    public function edit($id){
        $data['title'] = 'Edit Policy Type';
        $data['policy'] = Policytype::find($id);

        // if (!$policy) {
        //     return redirect()->route('frequency.policy')->with('error', 'policy not found.');
        // }
        // return view("admin/customer/edit")->with($data);
        return view("admin/policy_master/policy_type/edit")->with($data);

    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            // 'title' =>'required|string|max:255',
            'is_visible' => 'boolean',
        ]);


        $policy =  Policytype::find($id);

        if (!$policy ) {
            return redirect()->route('policy-type')->with('error', 'Policy Type not found.');
        }
        $policy->name=$request->name;
        $policy->title=$request->title;
        $policy->visibility=$request->is_visible;

        if ($policy->update()) {
            return redirect()->route('policy-type')->with('success', 'Policy Type updated successfully.');
        } else {
            return redirect()->back()->with('error', 'There was an error updating the Policy Type. Please try again.');
        }
    }

    public function delete($id)
    {
        $policy =  Policytype::find($id);

        if (!$policy ) {
            return redirect()->route('fpolicy-type')->with('error', 'Policy Type not found.');
        }

        if ($policy->delete()) {
            return redirect()->route('policy-type')->with('success', 'Policy Type deleted successfully.');
        } else {
            return redirect()->route('policy-type')->with('error', 'There was an error deleting the Policy Type. Please try again.');
        }
    }
}
