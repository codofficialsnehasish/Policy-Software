<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;
use App\Models\Policyterm;
use App\Models\FrequancyPolicy;
use App\Models\Customer;
use App\Models\Policy;
use App\Models\PolicyPaymentMode;
use App\Models\PaymentMode;
use App\Models\Agent;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

use Illuminate\Support\Facades\Storage;

class Admin extends Controller
{

    //==================== Register Admin ======================

    public function register_user(){
        $obj = new User();
        $obj->name = "Snehasish Bhurisrestha";
        $obj->status = 1;
        $obj->role = "admin";
        $obj->email  = "admin@admin.com";
        $obj->password  = bcrypt("admin");
        // $obj->api_access_key = $this->generateApiKey();
        $obj->save();
    }




    // ======================= Admin Login Methods =====================

    public function login(){
        $data['title'] = 'Login';
        return view("admin/authentication/login")->with($data);
    }

    public function checkuser(Request $r){
        if(Auth::attempt(["email"=>$r->email,"password"=>$r->pass])){
            return redirect(url('/dashboard'));
        }else{
            return redirect(url('/'))->with(["msg"=>"Invalid Login"]);
        }
    }

    public function logout(){
        Auth::logout();
        return redirect(url('/'));
    }

    public function change_password(){
        $data['title'] = 'Change Password';
        return view("admin/authentication/change_pass")->with($data);
    }

    public function change_pass(Request $r){
        $cp = $r->cp;
        $np = $r->np;
        $conpass = $r->conpass;
        if (Hash::check($cp, Auth::user()->password)) {
            if($np == $conpass){
                $obj = User::find(Auth::user()->id);
                $obj->password = bcrypt($np);
                $obj->update();
                Auth::logout();
                return redirect(url('/'));
            } else{
                return redirect(url('/changepass'))->with(["msg"=>"Not Matched Confirm Password"]);
            }
        } else {
            return redirect(url('/changepass'))->with(["msg"=>"Not Matched Current Password"]);
        }
    }
    // ==================== End of Admin login & logout Methods ====================



    //============================Dashboard======================

    public function dashboard(){
        $data['title'] = 'Dashboard';

        $customer_count = Customer::all()->count();

        $data['customer_count'] = $customer_count;
        $data['agent_count'] = Agent::all()->count();
        $data['policy_count'] = Policy::all()->count();
        $data['month_payment'] = PolicyPaymentMode::whereMonth('payment_date',date('m'))->sum('amount');

        return view("admin/dashboard")->with($data);
    }

    //==========xxxxxxx=======End of Dashboard===========xxxxxx=======

}
