<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;
use Illuminate\Validation\Rule;
use App\Models\Customer;
use App\Models\User;
use App\Models\Agent;
use App\Models\Area;
use Illuminate\Support\Str;
class AgentController extends Controller
{
    public function index(){
        $data['title'] = 'Users';
        $data['agent'] = Agent::all();
        return view("admin/agent/content")->with($data);
    }

    public function add_agent(){
        $data['title'] = 'Add Customer';
        $data['areas'] = Area::all();
        return view("admin/agent/add_user")->with($data);
    }

    public function process(Request $request){

        $request->validate([
            'agent_id' => 'required|string|unique:agents,agent_id',
            'name' => 'required|string|max:255',
            'phone' => 'required|digits:10|starts_with:6,7,8,9',
            'dob' => 'required|date_format:"d M, Y"',
            'gender' => 'required|in:Male,Female,Transgender',
            'status' => 'boolean',
            'area_id' => 'required|exists:areas,id',
        ]);
        // 'area_id' => 'required|exists:areas,id',
        // $randomCode = rand(100000, 999999);
        $randomCode = strtoupper(Str::random(3)) . mt_rand(100, 999);
        $agent = new Agent();
        $agent->agent_id = $request->agent_id;
        $agent->name = $request->name;
        $agent->father_or_husband = $request->father_or_husband;
        $agent->father_or_husband_name = $request->father_or_husbend_name;
        $agent->agent_code = $randomCode;
        $agent->phone = $request->phone;
        $agent->dob = $request->dob;
        $agent->gender = $request->gender;
        $agent->address = $request->address;
        $agent->status = $request->status;
        $agent->area_id = $request->area_id;

        if ($request->hasFile('image')) {
            $img = $request->file('image');
            // $filename = uniqid() . '.png';
            $filename = time() . '_' . $img->getClientOriginalName();
            print($filename);
            $directory = public_path('files/agents');
            $filePath = $directory . '/' . $filename;
            $img->move($directory, $filename);
            $filePath = env('APP_URL') . "files/agents/" . $filename;
            $agent->image = $filePath;
        }

        // $Customer->random_code = $randomCode;

        $res= $agent->save();
        if($res){
            return redirect()->route('agent')->with(['success'=>'Agent Added Successfully']);
        }else{
            return redirect()->back()->with(['error'=>'There was an error adding the Agent. Please try again!!']);
        }

    }

    public function edit($id){
        $data['title'] = 'Edit Agent';
        $Agent = Agent::find($id);
        $areas = Area::all();

        if (!$Agent) {
            return redirect()->route('agent')->with('error', 'Agent not found.');
        }
        // return view("admin/customer/edit")->with($data);
        return view('admin.agent.edit', [
            'title' => 'Edit Agent',
            'agent' => $Agent,
            'areas' =>$areas
        ]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'agent_id' => ['required','string',Rule::unique('agents')->ignore($id)],
            'name' => 'required|string|max:255',
            'phone' => 'required|digits:10|starts_with:6,7,8,9',
            'dob' => 'required|date_format:"d M, Y"',
            'gender' => 'required|in:Male,Female,Transgender',
            'status' => 'boolean',
            'area_id' => 'required|exists:areas,id',
        ]);

        $agent = Agent::find($id);

        if (!$agent) {
            return redirect()->route('agent')->with('error', 'Agent not found.');
        }

        $agent->agent_id = $request->agent_id;
        $agent->name = $request->name;
        $agent->father_or_husband = $request->father_or_husband;
        $agent->father_or_husband_name = $request->father_or_husbend_name;
        $agent->phone = $request->phone;
        $agent->dob = $request->dob;
        $agent->gender = $request->gender;
        $agent->address = $request->address;
        $agent->status = $request->status;
        $agent->area_id = $request->area_id;

        if ($request->hasFile('image')) {
            $img = $request->file('image');
            // $filename = uniqid() . '.png';
            $filename = time() . '_' . $img->getClientOriginalName();
            print($filename);
            $directory = public_path('files/agents');
            $filePath = $directory . '/' . $filename;
            $img->move($directory, $filename);
            $filePath = env('APP_URL') . "files/agents/" . $filename;
            $agent->image = $filePath;
        }

        if ($agent->update()) {
            return redirect()->route('agent')->with('success', 'Agent updated successfully.');
        } else {
            return redirect()->back()->with('error', 'There was an error updating the Agent. Please try again.');
        }
    }

    public function delete($id)
    {
        $customer = Agent::find($id);

        if (!$customer) {
            return redirect()->route('agent')->with('error', 'Agent not found.');
        }

        if ($customer->delete()) {
            return redirect()->route('agent')->with('success', 'Agent deleted successfully.');
        } else {
            return redirect()->route('agent')->with('error', 'There was an error deleting the Agent. Please try again.');
        }
    }
}
