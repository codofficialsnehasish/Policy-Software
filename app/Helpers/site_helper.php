<?php

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
use App\Models\User;
use App\Models\Wallets;
use App\Models\Notifications;
use App\Models\Game_settings;
use App\Models\Permission;
use App\Models\Module;

// app/Helpers/helpers.php

use Carbon\Carbon;

if (!function_exists('remainingTerm')) {
    /**
     * Calculate the remaining term for a policy.
     *
     * @param string $maturityDate
     * @return int
     */
    function remainingTerm($maturityDate)
    {
        $endDate = Carbon::parse($maturityDate);
        $now = Carbon::now();
        return $endDate->diffInYears($now);
    }
}

if (!function_exists('get_logo')) {
    function get_logo()
    {
        $logo = DB::table('settings')->select('logo')->get()[0]->logo;
        // return $logo;
        if ($logo) {
            return asset('site_data_images/' . $logo);
        } else {
            return asset('dashboard_assets/images/no-image.jpg');
        }
    }
}

if (!function_exists('get_icon')) {
    function get_icon()
    {
        $icon = DB::table('settings')->select('fabicon')->get()[0]->fabicon;
        // return $icon;
        if ($icon) {
            return asset('site_data_images/' . $icon);
        } else {
            return asset('dashboard_assets/images/no-image.jpg');
        }
    }
}

if (!function_exists('app_name')) {
    function app_name()
    {
        $name = DB::table('settings')->select('application_name')->get()[0]->application_name;
        return $name;
    }
}

if (!function_exists('copyright')) {
    function copyright()
    {
        $name = DB::table('settings')->select('copyright')->get()[0]->copyright;
        return $name;
    }
}

if (!function_exists('description')) {
    function description()
    {
        $site_description = DB::table('settings')->select('site_description')->get()[0]->site_description;
        return $site_description;
    }
}

if (!function_exists('general_settings')) {
    function general_settings()
    {
        $general_settings = DB::table('settings')->where('id', 1)->first();
        return $general_settings;
    }
}

if (!function_exists('get_game_prize_amount')) {
    function get_game_prize_amount()
    {
        $obj = Game_settings::find(1);
        return $obj->game_prize;
    }
}

if (!function_exists('get_all_data_according_to_date')) {
    function get_all_data_according_to_date($date)
    {
        $data = DB::table('results_data')->whereDate("date", $date)->get();
        return $data;
    }
}

if (!function_exists('generateOTP')) {
    function generateOTP($n = 4)
    {
        $otp = "";
        for ($i = 0; $i < $n; $i++) {
            $otp .= rand(0, 9);
        }
        return $otp;
    }
}

if (!function_exists('formated_date')) {
    function formated_date($datetime)
    {
        // Parse the datetime string into a Carbon instance
        $carbonDatetime = \Illuminate\Support\Carbon::parse($datetime);

        // Format the datetime using the desired format
        return $carbonDatetime->format('d M, Y');
    }
}

if (!function_exists('check_status')) {
    function check_status($status)
    {
        if ($status == 1) {
            $str = '<span class="badge bg-success" style="font-size:15px;">Active</span>';
        } else {
            $str = '<span class="badge bg-danger" style="font-size:15px;">Inactive</span>';
        }
        return $str;
    }
}

if (!function_exists('check_verified')) {
    function check_verified($status)
    {
        if ($status == 1) {
            $str = '<span class="text-success" title="Verified"><i class="fas fa-check-circle"></i></span>';
        } else {
            $str = '<span class="text-danger" title="Not Verified"><i class="fas fa-times-circle"></i></span>';
        }
        return $str;
    }
}

if (!function_exists('formated_time')) {
    function formated_time($time)
    {
        return date('h:i A', strtotime($time));
    }
}

if (!function_exists('check_visibility')) {
    function check_visibility($val)
    {
        if ($val == 1) {
            $str = '<span class="btn btn-success btn-sm"><i class="fas fa-eye" data-bs-toggle="tooltip" data-bs-placement="top" title="Visible"></i></span>';
        } else {
            $str = '<span class="btn btn-danger btn-sm"><i class="fas fa-eye-slash" data-bs-toggle="tooltip" data-bs-placement="top" title="Not Visible"></i></span>';
        }
        return $str;
    }
}

if (!function_exists('check_uncheck')) {
    function check_uncheck($val1, $val2)
    {
        if ($val1 == $val2) {
            $str = 'checked';
        } else {
            $str = '';
        }
        return $str;
    }
}

if (!function_exists('splitFullName')) {
    function splitFullName($fullName)
    {
        $parts = explode(" ", $fullName);
        $lastName = array_pop($parts);
        $firstName = array_shift($parts);
        $middleName = implode(" ", $parts);
        return compact('firstName', 'middleName', 'lastName');
    }
}

if (!function_exists('check_uncheck')) {
    function check_uncheck($val1, $val2)
    {
        if ($val1 == $val2) {
            $str = 'checked';
        } else {
            $str = '';
        }
        return $str;
    }
}

if (!function_exists('get_customer_by_id')) {
    function get_customer_by_id($id)
    {
        $customer = DB::table('customers')->where('id',$id)->first();
        return $customer;
    }
}

if (!function_exists('get_customer_name')) {
    function get_customer_name($id)
    {
        $customer = DB::table('users')->where('id', $id)->first();
        return $customer->name;
    }
}

if (!function_exists('get_customer_by_email')) {
    function get_customer_by_email($email)
    {
        $customer = DB::table('users')->where('email', $email)->first();
        return $customer;
    }
}

if (!function_exists('get_user_by_user_id')) {
    function get_user_by_user_id($user_id)
    {
        $user = DB::table('users')->where('user_id', $user_id)->first();
        return $user;
    }
}

if (!function_exists('maskedPhoneNumber')) {
    function maskedPhoneNumber($phoneNumber)
    {
        $lastTwoDigits = substr($phoneNumber, -2);
        $maskedDigits = str_pad("", strlen($phoneNumber) - 2, "x");
        $formattedNumber = $maskedDigits . $lastTwoDigits;
        return $formattedNumber;
    }
}

if (!function_exists('format_datetime')) {
    function format_datetime($datetime)
    {
        // Parse the datetime string into a Carbon instance
        $carbonDatetime = \Illuminate\Support\Carbon::parse($datetime);

        // Format the datetime using the desired format
        return $carbonDatetime->format('F d, Y h:i A');
    }
}

if (!function_exists('format_date')) {
    function format_date($date)
    {
        $carbonDatetime = \Illuminate\Support\Carbon::parse($date);
        return $carbonDatetime->format('d F, Y');
    }
}

if (!function_exists('get_contact_group')) {
    function get_contact_group($app_noti_id)
    {
        $contacts = DB::table('user_in_notification')->where('app_notification_id', $app_noti_id)->get();
        return $contacts;
    }
}

if (!function_exists('get_user_phone')) {
    function get_user_phone($id)
    {
        $user = DB::table('users')->where('id', $id)->first();
        return !empty($user) ? $user->phone : '';
    }
}

if (!function_exists('get_user_name')) {
    function get_user_name($id)
    {
        $user = DB::table('users')->where('id', $id)->first();
        return !empty($user) ? $user->name : '';
    }
}

if (!function_exists('calculate_percentage')) {
    function calculate_percentage($amount, $percentage)
    {
        return $amount * ($percentage / 100);
    }
}

if (!function_exists('is_have_image')) {
    function is_have_image($image)
    {
        if ($image) {
            return 'block';
        } else {
            return 'none';
        }
    }
}

if (!function_exists('get_formated_result_time')) {
    function get_formated_result_time($time_id)
    {
        $time = DB::table('game_times')->where('id', $time_id)->first();
        if (!empty($time->result_time)) {
            return formated_time($time->result_time);
        } else {
            return '';
        }
    }
}

if (!function_exists('check_winner')) {
    function check_winner($val)
    {
        if ($val == 1) {
            return '<b class="text-success h3">Winner<b>';
        } else {
            return '<b class="text-danger">Not Win<b>';
        }
    }
}

if (!function_exists('payment_status')) {
    function payment_status($val)
    {
        if ($val == 'Processing') {
            return '<a class="btn btn-warning text-dark font-weight-bold">PROCESSING<a>';
        } elseif ($val == 'Cancelled') {
            return '<a class="btn btn-danger text-white font-weight-bold">CANCELLED<a>';
        } else {
            return '<a class="btn btn-success text-white font-weight-bold">SUCCESS<a>';
        }
    }
}

if (!function_exists('have_loan_amount')) {
    function have_loan_amount($user_id)
    {
        $user = User::find($user_id);
        if ($user->loan_amount > 0) {
            return true;
        } else {
            return false;
        }
    }
}

if (!function_exists('pay_loan_amount')) {
    function pay_loan_amount($user_id, $amount = 0)
    {
        $user = User::find($user_id);
        $obj = new Wallets();
        if ($amount <= $user->loan_amount) {
            $user->wallet_balance -= $amount;
            $user->loan_amount -= $amount;
        }
        if ($user->loan_amount < $amount) {
            $amount = $user->loan_amount;
            $user->loan_amount = 0.00;
            $user->wallet_balance -= $amount;
        }

        $obj->status = "Debited (Loan)";

        $notification = new Notifications();
        $notification->date = date("Y-m-d");
        $notification->customer_id = $user_id;
        $notification->amount = $amount;
        $notification->which_for = 'Loan Amount Paid';
        $notification->mode = '';
        $notification->status = 'Success';
        $notification->seen = 1;
        $notification->save();

        $obj->date = date('d-m-Y');
        $obj->customer_id = $user_id;
        $obj->amount = $amount;
        $user->update();
        $obj->save();
    }
}

if (!function_exists('createSlug')) {
    function createSlug($name, $model)
    {
        $slug = Str::slug($name);
        $originalSlug = $slug;

        $count = 1;
        while ($model::where('directory', $slug)->exists()) {
            $slug = $originalSlug . '-' . $count++;
        }

        return $slug;
    }
}

if (!function_exists('get_module_name')) {
    function get_module_name($id)
    {
        $module = Module::find($id);
        return $module->name;
    }
}

if (!function_exists('have_permission')) {
    function have_permission($user_id, $directory_name, $permission)
    {
        $module = Module::where('directory', $directory_name)->first();
        if ($module) {
            $permission = Permission::where('user_id', $user_id)->where('module_id', $module->id)->where($permission, 1)->get();
            // return $module->name;
            // print_r($permission);
            if (!$permission->isEmpty()) {
                return true;
            }
        }
        return false;
    }
}

if(!function_exists('get_name')) {
    function get_name($table,$id) {
        $name = DB::table($table)->where('id',$id)->first();
        if(!empty($name)){
            return $name->name;
        }else{
            return '';
        }
    }
}

if(!function_exists('get_customer_id')) {
    function get_customer_id($id) {
        $customer = DB::table('customers')->where('id',$id)->first();
        if(!empty($customer)){
            return $customer->customer_id;
        }else{
            return '';
            // return $customer;
        }
    }
}
