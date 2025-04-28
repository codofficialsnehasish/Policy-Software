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

class Customers extends Controller
{
    public function index()
    {
        $data['title'] = 'Users';
        $data['customer'] = Customer::all();
        return view("admin/customer/content")->with($data);
    }

    public function get_customer_image(Request $request){
        $customer = Customer::find($request->customer_id);
        echo !empty($customer->image) ? $customer->image : '';
    }

    public function add_customer()
    {
        $data['title'] = 'Add Customer';
        $data['areas'] = Area::all();
        $data['Agent'] = Agent::all();

        return view("admin/customer/add_user")->with($data);
    }

    public function process(Request $request)
    {

        $request->validate([
            'customer_id' => 'required|string|unique:customers,customer_id',
            'name' => 'required|string|max:255',
            'phone' => 'required|digits:10|starts_with:6,7,8,9',
            'dob' => 'required|date_format:"d M, Y"',
            'gender' => 'required|in:Male,Female,Transgender',
            'status' => 'boolean',
            'area_id' => 'required|exists:areas,id',
            'agent_id' => 'required|exists:agents,id',
        ]);
        // 'area_id' => 'required|exists:areas,id',

        $Customer = new Customer();
        $Customer->customer_id = $request->customer_id;
        $Customer->name = $request->name;
        $Customer->father_or_husband = $request->father_or_husband;
        $Customer->father_or_husband_name = $request->father_or_husbend_name;
        $Customer->agent_id = $request->agent_id;
        $Customer->phone = $request->phone;
        $Customer->alternative_phone = $request->alternative_phone;
        $Customer->dob = $request->dob;
        $Customer->gender = $request->gender;
        $Customer->address = $request->address;
        $Customer->status = $request->status;
        $Customer->area_id = $request->area_id;

        if ($request->hasFile('image')) {
            $img = $request->file('image');
            // $filename = uniqid() . '.png';
            $filename = time() . '_' . $img->getClientOriginalName();
            // print($filename);
            $directory = public_path('files/agents');
            $filePath = $directory . '/' . $filename;
            $img->move($directory, $filename);
            $filePath = env('APP_URL') . "files/agents/" . $filename;
            $Customer->image = $filePath;
        }
        if ($request->hasFile('image2')) {
            $img = $request->file('image2');
            // $filename = uniqid() . '.png';
            $filename = time() . '_' . $img->getClientOriginalName();
            // print($filename);
            $directory = public_path('files/agents');
            $filePath = $directory . '/' . $filename;
            $img->move($directory, $filename);
            $filePath = env('APP_URL') . "files/agents/" . $filename;
            $Customer->nominee_image = $filePath;
        }
        // $Customer->random_code = $randomCode;

        $res = $Customer->save();
        if ($res) {
            return redirect()->route('customer')->with(['success' => 'Customer Added Successfully']);
        } else {
            return redirect()->back()->with(['error' => 'There was an error adding the Customer. Please try again!!']);
        }
    }

    public function edit($id)
    {
        $data['title'] = 'Edit Customer';
        $customer = Customer::find($id);
        $Agent = Agent::all();
        $areas = Area::all();

        if (!$customer) {
            return redirect()->route('customer.index')->with('error', 'Customer not found.');
        }
        // return view("admin/customer/edit")->with($data);
        return view('admin.customer.edit', [
            'title' => 'Edit Customer',
            'customer' => $customer,
            'Agent' => $Agent,
            'areas' =>$areas
        ]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'customer_id' => ['required','string',Rule::unique('customers')->ignore($id)],
            'name' => 'required|string|max:255',
            'phone' => 'required|digits:10|starts_with:6,7,8,9',
            'alternative_phone' => 'nullable|digits:10',
            'dob' => 'required|date_format:"d M, Y"',
            'gender' => 'required|in:Male,Female,Transgender',
            'status' => 'boolean',
            'area_id' => 'required|exists:areas,id',
            'agent_id' => 'required|exists:agents,id',
        ]);

        $customer = Customer::find($id);

        if (!$customer) {
            return redirect()->route('customer')->with('error', 'Customer not found.');
        }
        $customer->customer_id = $request->customer_id;
        $customer->name = $request->name;
        $customer->father_or_husband = $request->father_or_husband;
        $customer->father_or_husband_name = $request->father_or_husbend_name;
        $customer->agent_id = $request->agent_id;
        $customer->phone = $request->phone;
        $customer->alternative_phone = $request->alternative_phone;
        $customer->dob = $request->dob;
        $customer->gender = $request->gender;
        $customer->status = $request->status;
        $customer->area_id = $request->area_id;

        if ($request->hasFile('image')) {
            $img = $request->file('image');
            // $filename = uniqid() . '.png';
            $filename = time() . '_' . $img->getClientOriginalName();
            print($filename);
            $directory = public_path('files/agents');
            $filePath = $directory . '/' . $filename;
            $img->move($directory, $filename);
            $filePath = env('APP_URL') . "files/agents/" . $filename;
            $customer->image = $filePath;
        }
        if ($request->hasFile('image2')) {
            $img = $request->file('image2');
            // $filename = uniqid() . '.png';
            $filename = time() . '_' . $img->getClientOriginalName();
            // print($filename);
            $directory = public_path('files/agents');
            $filePath = $directory . '/' . $filename;
            $img->move($directory, $filename);
            $filePath = env('APP_URL') . "files/agents/" . $filename;
            $customer->nominee_image = $filePath;
        }
        if ($customer->update()) {
            return redirect()->route('customer')->with('success', 'Customer updated successfully.');
        } else {
            return redirect()->back()->with('error', 'There was an error updating the customer. Please try again.');
        }
    }
    public function delete($id)
    {
        $customer = Customer::find($id);

        if (!$customer) {
            return redirect()->route('customer')->with('error', 'Customer not found.');
        }

        if ($customer->delete()) {
            return redirect()->route('customer')->with('success', 'Customer deleted successfully.');
        } else {
            return redirect()->route('customer')->with('error', 'There was an error deleting the customer. Please try again.');
        }
    }
}
