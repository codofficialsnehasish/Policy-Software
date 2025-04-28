<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Area;
class AreaController extends Controller
{
    public function index(){
        $data['title'] = 'Area Master';
        $data['Area'] = Area::all();
        return view("admin/policy_master/area/content")->with($data);
    }

    public function add(){
        $data['title'] = 'Add New Area';
        return view("admin/policy_master/area/add")->with($data);
    }

    public function process(Request $request){


        $request->validate([
            'name' => 'required|string|max:255',
            'pincode' => 'required|string|size:6',
            'state' => 'required|string|max:255',
            'district' => 'required|string|max:255',
            'station' => 'required|string|max:255',
            'landmark' => 'string|max:255',
            'is_visible' => 'boolean',
        ]);

        $area = new Area();
        $area->name = $request->name;
        $area->pincode = $request->pincode;
        $area->state = $request->state;
        $area->district = $request->district;
        $area->police_station = $request->station;
        $area->landmark = $request->landmark;
        $area->visibility=$request->is_visible;
        // Save the area
        $res=$area->save();

        if($res){
            return redirect()->route('area')->with(['success'=>'Area Added Successfully']);
        }else{
            return redirect()->back()->with(['error'=>'There was an error adding the Policy Area. Please try again!!']);
        }
    }

    public function edit($id){
        $data['title'] = 'Edit Area';
        $data['area'] = Area::find($id);
        return view("admin/policy_master/area/edit")->with($data);

    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'pincode' => 'required|string|size:6',
            'state' => 'required|string|max:255',
            'district' => 'required|string|max:255',
            'station' => 'required|string|max:255',
            'landmark' => 'string|max:255',
            'is_visible' => 'boolean',
        ]);
        $area = Area::find($id);
        $area->name = $request->name;
        $area->pincode = $request->pincode;
        $area->state = $request->state;
        $area->district = $request->district;
        $area->police_station = $request->station;
        $area->landmark = $request->landmark;
        $area->visibility=$request->is_visible;

        if ($area->update()) {
            return redirect()->route('area')->with('success', 'Area updated successfully.');
        } else {
            return redirect()->back()->with('error', 'There was an error updating the Area. Please try again.');
        }
    }

    public function delete($id)
    {
        $area = Area::find($id);

        if (!$area ) {
            return redirect()->route('area')->with('error', 'Area not found.');
        }

        if ($area->delete()) {
            return redirect()->route('area')->with('success', 'Area deleted successfully.');
        } else {
            return redirect()->route('area')->with('error', 'There was an error deleting the Area. Please try again.');
        }
    }

}
