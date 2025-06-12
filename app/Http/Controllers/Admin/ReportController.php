<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Area;
use App\Models\Customer;
use App\Models\Policy;
use App\Models\PolicyPaymentMode;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use App\Models\Agent;
use App\Models\Policyterm;
use App\Models\PaymentMode;

use Barryvdh\DomPDF\Facade\Pdf;

class ReportController extends Controller
{

    public function areaWiseStatement1(Request $request){
        $data['title'] = 'Area Wise Statement';

        $fromDate = $request->has('from_date') ? $request->from_date : null;
        $toDate = $request->has('to_date') ? $request->to_date : null;

        // Build the query with necessary joins and aggregations
        $query = DB::table('areas')
            ->leftJoin('customers', 'areas.id', '=', 'customers.area_id')
            ->leftJoin('policies', 'customers.id', '=', 'policies.customer_id')
            ->select('areas.id as area_id', 'areas.name as area_name', 'areas.pincode', 'areas.state', 'areas.district', 'areas.police_station', 'areas.landmark', 'areas.visibility')
            ->selectRaw('COUNT(DISTINCT customers.id) as total_customers')
            ->selectRaw('COUNT(policies.id) as total_policies')
            ->selectRaw('SUM(policies.sum_assured) as total_sell_amount')
            ->selectRaw('SUM(policies.policy_term) as total_policy_tenure')
            ->selectRaw('SUM(CASE WHEN DATE(policies.created_at) = CURDATE() THEN 1 ELSE 0 END) as today_policies')
            ->selectRaw('SUM(CASE WHEN DATE(policies.created_at) = CURDATE() THEN policies.sum_assured ELSE 0 END) as today_sell_amount')
            ->groupBy('areas.id', 'areas.name', 'areas.pincode', 'areas.state', 'areas.district', 'areas.police_station', 'areas.landmark', 'areas.visibility');

        // Apply date filters if present
        if ($fromDate && $toDate) {
            $query->whereBetween(DB::raw('DATE(policies.created_at)'), [$fromDate, $toDate]);
        }

        $data['areas'] = $query->get();

        $data['totalSellToday'] = Policy::whereDate('created_at', Carbon::today())->count();
        $data['totalSellMonthly'] = Policy::whereMonth('created_at', Carbon::now()->month)
            ->whereYear('created_at', Carbon::now()->year)->count();
        $data['totalSellDatewise'] = Policy::whereBetween('created_at', [$fromDate, $toDate])->count();

        // $query = Area::query();

        // if ($request->has('from_date') && $request->has('to_date')) {
        //     $fromDate = $request->from_date;
        //     $toDate = $request->to_date;
        //     $query->whereBetween(DB::raw('DATE(created_at)'), [$fromDate, $toDate]);
        // }

        // $data['areas'] =
        // // $query->with(['customers.policies'])->get();
        // $query = DB::table('areas')
        // ->leftJoin('customers', 'areas.id', '=', 'customers.area_id')
        // ->leftJoin('policies', 'customers.id', '=', 'policies.customer_id')
        // ->select('areas.id as area_id', 'areas.name as area_name')
        // ->selectRaw('COUNT(DISTINCT customers.id) as total_customers')
        // ->selectRaw('COUNT(policies.id) as total_policies')
        // ->selectRaw('SUM(policies.sum_assured) as total_sell_amount')
        // ->selectRaw('SUM(policies.policy_term) as total_policy_tenure')
        // ->selectRaw('SUM(CASE WHEN policies.created_at = CURDATE() THEN 1 ELSE 0 END) as today_policies')
        // ->selectRaw('SUM(CASE WHEN policies.created_at = CURDATE() THEN policies.sum_assured ELSE 0 END) as today_sell_amount');
        // // ->groupBy('areas.id', 'areas.name');

        // $data['totalSellToday'] = Policy::whereDate('created_at', Carbon::today())->count();
        // $data['totalSellMonthly'] = Policy::whereMonth('created_at', Carbon::now()->month)
        //                           ->whereYear('created_at', Carbon::now()->year)->count();
        // $data['totalSellDatewise'] = Policy::whereBetween('created_at', [$request->from_date, $request->to_date])->count();

        return view("admin/Report/content")->with($data);

        // return view('reports.areaWiseStatement', compact('areas', 'totalSellToday', 'totalSellMonthly', 'totalSellDatewise'));
    }

    // public function areaWiseStatement(Request $request)
    // {
    //     $data['title'] = 'Area Wise Statement';

    //     $query = DB::table('areas')
    //                 ->leftJoin('customers', 'areas.id', '=', 'customers.area_id')
    //                 ->leftJoin('policies', 'customers.id', '=', 'policies.customer_id')
    //                 ->select('areas.id as area_id', 'areas.*', DB::raw('COUNT(DISTINCT customers.id) as total_customers'), DB::raw('COUNT(policies.id) as total_policies'))
    //                 ->groupBy('areas.id');

    //     if ($request->has('from_date') && $request->has('to_date')) {
    //         $fromDate = $request->from_date;
    //         $toDate = $request->to_date;
    //         $query->whereBetween(DB::raw('DATE(policies.created_at)'), [$fromDate, $toDate]);
    //     }

    //     $data['areas'] = $query->get();
    //     $data['totalSellToday'] = Policy::whereDate('created_at', Carbon::today())->count();
    //     $data['totalSellMonthly'] = Policy::whereMonth('created_at', Carbon::now()->month)
    //                               ->whereYear('created_at', Carbon::now()->year)->count();

    //     // return view("admin.areawise.content")->with($data);
    //     return view("admin/Report/areawise")->with($data);
    // }

    // public function fetchAreaData(Request $request)
    // {
    //     $areaId = $request->area_id;

    //     $area = Area::with(['customers.policies'])->find($areaId);

    //     return response()->json($area);
    // }

    public function areaWiseStatement(Request $request){
        $data['title'] = 'Area Wise Statement';

        // $results = DB::select(
        //     DB::raw("
        //         SELECT
        //             areas.id AS area_id,
        //             areas.name,
        //             areas.pincode,
        //             areas.state,
        //             areas.district,
        //             areas.police_station,
        //             areas.landmark,
        //             COUNT(DISTINCT customers.id) AS total_customers,
        //             COUNT(policies.id) AS total_policies
        //         FROM
        //             areas
        //         LEFT JOIN customers ON areas.id = customers.area_id
        //         LEFT JOIN policies ON customers.id = policies.customer_id
        //         GROUP BY
        //             areas.id,
        //             areas.name,
        //             areas.pincode,
        //             areas.state,
        //             areas.district,
        //             areas.police_station,
        //             areas.landmark
        //     ")
        // );

        $results = DB::select("
        SELECT
            areas.id AS area_id,
            areas.name,
            areas.pincode,
            areas.state,
            areas.district,
            areas.police_station,
            areas.landmark,
            COUNT(DISTINCT customers.id) AS total_customers,
            COUNT(policies.id) AS total_policies
        FROM
            areas
        LEFT JOIN customers ON areas.id = customers.area_id
        LEFT JOIN policies ON customers.id = policies.customer_id
        GROUP BY
            areas.id,
            areas.name,
            areas.pincode,
            areas.state,
            areas.district,
            areas.police_station,
            areas.landmark
        ");

        // $query = DB::table('areas')
        //     ->leftJoin('customers', 'areas.id', '=', 'customers.area_id')
        //     ->leftJoin('policies', 'customers.id', '=', 'policies.customer_id')
        //     ->select(
        //         'areas.id as area_id',
        //         'areas.name',
        //         'areas.pincode',
        //         'areas.state',
        //         'areas.district',
        //         'areas.police_station',
        //         'areas.landmark',
        //         DB::raw('COUNT(DISTINCT customers.id) as total_customers'),
        //         DB::raw('COUNT(policies.id) as total_policies')
        //     )
        //     ->groupBy('areas.id','areas.name');
        // ->get();
        // if ($request->has('from_date') && $request->has('to_date')) {
        //     $fromDate = $request->from_date;
        //     $toDate = $request->to_date;
        //     $query->whereBetween(DB::raw('DATE(policies.created_at)'), [$fromDate, $toDate]);
        // }

        // $results = DB::table('areas')
        //     ->select(
        //         'areas.id AS area_id',
        //         'areas.name',
        //         'areas.pincode',
        //         'areas.state',
        //         'areas.district',
        //         'areas.police_station',
        //         'areas.landmark',
        //         DB::raw('COUNT(DISTINCT customers.id) AS total_customers'),
        //         DB::raw('COUNT(policies.id) AS total_policies')
        //     )
        //     ->leftJoin('customers', 'areas.id', '=', 'customers.area_id')
        //     ->leftJoin('policies', 'customers.id', '=', 'policies.customer_id')
        //     ->groupBy('areas.id', 'areas.name', 'areas.pincode', 'areas.state', 'areas.district', 'areas.police_station', 'areas.landmark')
        //     ->get();

        $data['areas'] = $results;
        // $data['areas'] = $query->get();
        $data['totalSellToday'] = Policy::whereDate('created_at', Carbon::today())->count();
        $data['totalSellMonthly'] = Policy::whereMonth('created_at', Carbon::now()->month)
            ->whereYear('created_at', Carbon::now()->year)->count();

        return view("admin.Report.areawise")->with($data);
    }

    public function fetchAreaData(Request $request){
        $areaId = $request->area_id;

        $area = DB::table('areas')
            ->where('id', $areaId)
            ->first();

        $customers = DB::table('customers')
            ->where('area_id', $areaId)
            ->get();

        foreach ($customers as &$customer) {
            $customer->policies = DB::table('policies')
                ->where('customer_id', $customer->id)
                ->get();
        }

        $area->customers = $customers;

        return response()->json($area);
    }

    // public function dailyCashbook(Request $request)
    // {
    //     $date = Carbon::parse($request->input('date', today()));

    //     // Fetch daily cash received and bank transfer amounts
    //     $dailyCashReceived = PolicyPaymentMode::where('payment_mode', 'cash')
    //                         ->whereDate('created_at', $date)
    //                         ->sum('amount');

    //     $dailyBankTransfer = PolicyPaymentMode::where('payment_mode', 'bank_transfer')
    //                         ->whereDate('created_at', $date)
    //                         ->sum('amount');

    //     // Calculate cash in hand for the selected date
    //     $cashInHand = PolicyPaymentMode::whereDate('created_at', '<=', $date)
    //                     ->where('payment_mode', 'cash')
    //                     ->sum('amount') - $dailyBankTransfer;

    //     // Fetch month-wise total statements for cash received and bank transfer
    //     $monthTransactions = PolicyPaymentMode::select(
    //             DB::raw('DATE_FORMAT(created_at, "%Y-%m") as month'),
    //             DB::raw('SUM(CASE WHEN payment_mode = "cash" THEN amount ELSE 0 END) as total_cash'),
    //             DB::raw('SUM(CASE WHEN payment_mode = "bank_transfer" THEN amount ELSE 0 END) as total_bank_transfer')
    //         )
    //         ->whereYear('created_at', $date->year)
    //         ->groupBy('month')
    //         ->orderBy('month', 'desc')
    //         ->get();

    //     // Fetch all customers for display in the template
    //     $customers = Customer::all();

    //     $title = 'Daily Cashbook ';


    //     return view('admin.Report.daily_cashbook', compact('title','date', 'dailyCashReceived', 'dailyBankTransfer', 'cashInHand', 'monthTransactions', 'customers'));
    // }

    public function dailyCashbook(Request $request)
    {
        $date = Carbon::parse($request->input('date', today()));

        $dailyPayments = PolicyPaymentMode::whereDate('created_at', $date)->get();

        $cashReceived = $dailyPayments->where('payment_mode', 'cash')->sum('amount');
        $bankTransfer = $dailyPayments->where('payment_mode', 'bank_transfer')->sum('amount');
        $cashInHand = PolicyPaymentMode::where('payment_mode', 'cash')
            ->whereDate('created_at', '<=', $date)
            ->sum('amount') - $bankTransfer;

        // Fetch month-wise transactions
        $monthTransactions = PolicyPaymentMode::select(
            DB::raw('DATE_FORMAT(created_at, "%Y-%m") as month'),
            DB::raw('SUM(CASE WHEN payment_mode = "cash" THEN amount ELSE 0 END) as total_cash'),
            DB::raw('SUM(CASE WHEN payment_mode = "bank_transfer" THEN amount ELSE 0 END) as total_bank_transfer')
        )
            ->groupBy('month')
            ->orderBy('month', 'desc')
            ->get();

        $title = 'Daily Cashbook ';
        return view('admin.Report.daily_cashbook', compact('title', 'date', 'cashReceived', 'bankTransfer', 'cashInHand', 'monthTransactions'));
    }

    public function areaWiseAgentList1(Request $request){
        $areas = Area::all();
        $areaId = $request->input('area_id');
        $data = ['areas' => $areas];

        if ($areaId) {
            $agents = Agent::where('area_id', $areaId)->get();
            $customers = Customer::where('area_id', $areaId)->get();

            // return  $customers->id;

            // Fetch policies for customers in the selected area
            $policies = Policy::where('customer_id', $customers->id)->get();
            // $policies = Policy::whereIn('customer_id', $customers->pluck('id'))->get();

            // Fetch policy terms for the fetched policies
            $policyIds = $policies->id;
            // $policyIds = $policies->pluck('id');

            // $policyTerms = Policyterm::where('policy_no', $policyIds)->get();

            // $policyTerms = Policyterm::whereIn('policy_no', $policyIds)->get();

            $data['selectedArea'] = Area::find($areaId);
            $data['agents'] = $agents;
            $data['customers'] = $customers;
            $data['policies'] = $policies;
            // $data['policyTerms'] = $policyTerms;
        }
        $data['title'] = 'Area Wise Agent-List';
        return view("admin/Report/agent_list")->with($data);
        // return view('admin.Report.agent_list', $data);
    }

    public function areaWiseAgentList2(Request $request){

        $areas = Area::all();


        $areaId = $request->input('area_id');

        $data = ['areas' => $areas];


        if ($areaId) {

            $agents = Agent::where('area_id', $areaId)->get();
            $customers = Customer::where('area_id', $areaId)->get();


            $policyIds = [];
            $policyTerms = [];


            foreach ($customers as $customer) {
                $policies = Policy::where('customer_id', $customer->id)->get();
                // Append policy IDs to the $policyIds array
                $policyIds = array_merge($policyIds, $policies->pluck('id')->toArray());
            }

            if (!empty($policyIds)) {
                $policyTerms = Policyterm::whereIn('policy_no', $policyIds)->get();
            }

            // Prepare data to pass to the view
            $data['selectedArea'] = Area::find($areaId);
            $data['agents'] = $agents;
            $data['customers'] = $customers;
            $data['policies'] = $policies;
            $data['policyTerms'] = $policyTerms;
        }

        $data['title'] = 'Area Wise Agent-List'; // Set the page title

        // Return the view with the prepared data
        return view("admin/Report/agent_list")->with($data);
    }

    public function areaWiseAgentList9(Request $request){
        $areas = Area::all();
        $areaId = $request->input('area_id');
        $data = ['areas' => $areas];

        if ($areaId) {
            $agents = Agent::where('area_id', $areaId)->get();
            $customers = Customer::where('area_id', $areaId)->get();

            $policyIds = [];
            $policies = [];
            $policyTerms = [];

            foreach ($customers as $customer) {
                $customerPolicies = Policy::where('customer_id', $customer->id)->get();
                $policies = array_merge($policies, $customerPolicies->toArray());
                $policyIds = array_merge($policyIds, $customerPolicies->pluck('id')->toArray());
            }

            if (!empty($policyIds)) {
                $policyTerms = Policyterm::whereIn('policy_no', $policyIds)->get();
            }

            $data['selectedArea'] = Area::find($areaId);
            $data['agents'] = $agents;
            $data['customers'] = $customers;
            $data['policies'] = $policies;
            $data['policyTerms'] = $policyTerms;
        }

        $data['title'] = 'Area Wise Agent-List';

        return view("admin/Report/agent_list")->with($data);
    }

    public function areaWiseAgentList(Request $request){

        $areas = Area::all();

        $areaId = $request->input('area_id');

        $data = ['areas' => $areas];


        if ($areaId) {

            $agents = Agent::where('area_id', $areaId)->get();
            $customers = Customer::where('area_id', $areaId)->get();
            //  $customers = Customer::where('agent_id', $agents->id)->get();


            $policyIds = DB::table('policies')
                ->whereIn('customer_id', $customers->pluck('id'))
                ->pluck('id');

            $policies = Policy::whereIn('id', $policyIds)->get();


            // $policyTerms = Policyterm::whereIn('policy_no', $policyIds)->get()->groupBy('policy_no');

            // Prepare data to pass to the view
            $data['selectedArea'] = Area::find($areaId);
            $data['agents'] = $agents;
            $data['customers'] = $customers;
            $data['policies'] = $policies;
            // $data['policyTerms'] = $policyTerms;
        }

        $data['title'] = 'Area Wise Agent-List';

        return view("admin.Report.agent_list")->with($data);
    }


    //@@@@@@@@@@@@@ DailyCashbook @@@@@@@@@@//

    public function all_transaction(Request $request)
    {
        $policyPaymentModes = PolicyPaymentMode::all();
        // $paymentModes = PaymentMode::where('id',$policyPaymentModes->payment_mode)->first();
        // $data['PaymentModes_name']= $paymentModes->name;

        $data = [];

        $paymentModesWithCustomers = [];


        // foreach ($policyPaymentModes as $paymentMode) {

        //     $customer = Customer::find($paymentMode->customer_id);

        //     if ($customer) {

        //         $paymentMode->customer_name = $customer->name;
        //         $paymentModesWithCustomers[] = $paymentMode;
        //     } else {

        //         return redirect()->back()->with(['error' => 'Invalid Customer ID. Please input Correct Customer ID!!']);
        //     }
        // }

        // Prepare data for the view
        $data['title'] = 'All Transactions';
        $data['policyPaymentModes'] = $policyPaymentModes;

        return view("admin.cashbook.content")->with($data);
    }

    public function cash_in_hand(Request $request)
    {
        $policyPaymentModes = PolicyPaymentMode::leftJoin('payment_modes','policy_payment_modes.payment_mode','payment_modes.id')
                            ->where('payment_modes.name','Cash')
                            ->get();
        // $paymentModes = PaymentMode::where('id',$policyPaymentModes->payment_mode)->first();
        // $data['PaymentModes_name']= $paymentModes->name;

        $data = [];

        $paymentModesWithCustomers = [];


        // foreach ($policyPaymentModes as $paymentMode) {

        //     $customer = Customer::find($paymentMode->customer_id);

        //     if ($customer) {

        //         $paymentMode->customer_name = $customer->name;
        //         $paymentModesWithCustomers[] = $paymentMode;
        //     } else {

        //         return redirect()->back()->with(['error' => 'Invalid Customer ID. Please input Correct Customer ID!!']);
        //     }
        // }

        // Prepare data for the view
        $data['title'] = 'Cash in Hand';
        $data['policyPaymentModes'] = $policyPaymentModes;

        return view("admin.cashbook.cash_in_hand")->with($data);
    }


    public function transaction1(Request $request){
        // Fetch the selected payment mode from the request
        $selectedPaymentModeId = $request->input('payment_mode_id');

        // Fetch all payment modes for the dropdown
        $paymentModes = PaymentMode::all();

        // Fetch policy payment modes based on the selected payment mode
        if ($selectedPaymentModeId) {
            $policyPaymentModes = PolicyPaymentMode::where('payment_mode_id', $selectedPaymentModeId)->get();
        } else {
            $policyPaymentModes = PolicyPaymentMode::all();
        }

        $paymentModesWithCustomers = [];

        foreach ($policyPaymentModes as $paymentMode) {
            $customer = Customer::find($paymentMode->customer_id);

            if ($customer) {
                $paymentMode->customer_name = $customer->name;
                $paymentMode->name = $paymentMode->name;
                $paymentModesWithCustomers[] = $paymentMode;

            } else {
                return redirect()->back()->with(['error' => 'Invalid Customer ID. Please input Correct Customer ID!!']);
            }
        }

        // Prepare data for the view
        $data['title'] = 'All Transactions';
        $data['policyPaymentModes'] = $paymentModesWithCustomers;
        $data['paymentModes'] = $paymentModes;
        $data['selectedPaymentModeId'] = $selectedPaymentModeId;

        return view("admin.cashbook.transaction")->with($data);
    }

    public function transaction(Request $request){
        // Fetch the selected payment mode name from the request
        $selectedPaymentModeName = $request->input('payment_mode_name');

        // Fetch all payment modes for the dropdown
        $paymentModes = PaymentMode::all();

        // Fetch policy payment modes based on the selected payment mode name
        if ($selectedPaymentModeName) {
            $paymentMode = PaymentMode::where('name', $selectedPaymentModeName)->first();

            if (!$paymentMode) {
                // Handle case where selected payment mode does not exist
                return redirect()->back()->with(['error' => 'Invalid Payment Mode selected. Please choose a valid option.']);
            }

            $policyPaymentModes = PolicyPaymentMode::where('payment_mode', $paymentMode->id)->get();
        } else {
            $policyPaymentModes = PolicyPaymentMode::all();
        }

        $paymentModesWithCustomers = [];
        $totalAmount = 0;

        foreach ($policyPaymentModes as $paymentMode) {
            $customer = Customer::find($paymentMode->customer_id);

            if ($customer) {
                $paymentMode->customer_name = $customer->name;
                $paymentMode->name = $paymentMode->name;
                $paymentModesWithCustomers[] = $paymentMode;
                $totalAmount += $paymentMode->amount;
            }
            // } else {
            //     return redirect()->back()->with(['error' => 'Invalid Customer ID. Please input Correct Customer ID!!']);
            // }
        }

        // Prepare data for the view
        $data['title'] = 'All Transactions';
        $data['policyPaymentModes'] = $paymentModesWithCustomers;
        $data['paymentModes'] = $paymentModes;
        $data['selectedPaymentModeName'] = $selectedPaymentModeName;
        $data['totalAmount'] = $totalAmount;

        return view("admin.cashbook.transaction")->with($data);
    }

    public function month_wise1(Request $request){

        // Fetch the selected month and year from the request
        $selectedMonth = $request->input('month');
        $selectedYear = $request->input('year');

        // Fetch policy payment modes based on the selected month and year
        // $policyPaymentModesQuery = PolicyPaymentMode::all();
        // $policyPaymentModesQuery = PolicyPaymentMode::query();
        $query = PolicyPaymentMode::with(['customer', 'paymentMode']);


        // if ($selectedMonth && $selectedYear) {
        //     $policyPaymentModesQuery->whereYear('created_at', $selectedYear)
        //                             ->whereMonth('created_at', $selectedMonth);
        // }

        if ($selectedMonth && $selectedYear) {
            $query->whereYear('created_at', $selectedYear)
                ->whereMonth('created_at', $selectedMonth);
        }

        $policyPaymentModes = $query->get();

        // Calculate the total amount
        $totalAmount = $policyPaymentModes->sum('amount');

        // Fetch policy payment modes and calculate total amount
        // $policyPaymentModes = $policyPaymentModesQuery->get();
        // $totalAmount = $policyPaymentModes->sum('amount');

        $paymentModesWithCustomers = [];

        // foreach ($policyPaymentModes as $paymentMode) {
        //     $customer = Customer::find($paymentMode->customer_id);

        //     if ($customer) {
        //         $paymentMode->customer_name = $customer->name;
        //         $paymentMode->name = $paymentMode->name;
        //         $paymentModesWithCustomers[] = $paymentMode;
        //     } else {
        //         return redirect()->back()->with(['error' => 'Invalid Customer ID. Please input Correct Customer ID!!']);
        //     }
        // }

        // Prepare data for the view
        // $data['title'] = 'Month-wise Transactions';
        // $data['selectedMonth'] = $selectedMonth;
        // $data['selectedYear'] = $selectedYear;
        // $data['policyPaymentModes'] = $paymentModesWithCustomers;
        // $data['totalAmount'] = $totalAmount;

        $data = [
            'title' => 'Month-wise Transactions',
            'selectedMonth' => $selectedMonth,
            'selectedYear' => $selectedYear,
            'policyPaymentModes' => $policyPaymentModes,
            'totalAmount' => $totalAmount,
        ];

        return view("admin.cashbook.month_wise_transaction")->with($data);
    }


    public function month_wise(Request $request)
    {
        // $selectedMonth = $request->input('month');
        // $selectedYear = $request->input('year');

        $selectedMonth = $request->input('start');
        $selectedYear = $request->input('end');
        $button = $request->input('button');
        // print($selectedMonth);die;

        // Build the query using DB facade
        $query = DB::table('policy_payment_modes')
            ->join('customers', 'policy_payment_modes.customer_id', '=', 'customers.id')
            ->leftJoin('payment_modes', 'policy_payment_modes.payment_mode', '=', 'payment_modes.name') // Adjust join based on your actual relationship
            ->select(
                'policy_payment_modes.*',
                'customers.name as customer_name',
                'payment_modes.title as payment_mode_title' // Adjust based on your actual payment mode column
            );

        // Filter by month and year if provided
        if ($selectedMonth && $selectedYear) {
            $query->whereDate('policy_payment_modes.payment_date','>=', $selectedMonth)
            ->whereDate('policy_payment_modes.payment_date','<=', $selectedYear);
        }
        // if ($selectedMonth && $selectedYear) {
        //     $query->whereDate('policy_payment_modes.created_at','>=', '01 Jan 2025')
        //     ->whereDate('policy_payment_modes.created_at','<=', '01 Jan 2025');
        // }

        // Execute the query and get results
        // $sql = $query->toSql();

        // // Output the SQL query
        // dd($sql);

        $policyPaymentModes = $query->get();
        $totalAmount = $policyPaymentModes->sum('amount'); // Calculate total amount

        // Prepare data for the view
        $data = [
            'title' => 'Month-wise Transactions',
            'selectedMonth' => $selectedMonth,
            'selectedYear' => $selectedYear,
            'policyPaymentModes' => $policyPaymentModes,
            'totalAmount' => $totalAmount,
            'start_date' => $selectedMonth,
            'end_date' => $selectedYear
        ];

        if($button == 'download'){
            return $this->exportPdf($data);
        }
        // Return view with data
        return view("admin.cashbook.month_wise_transaction")->with($data);
    }

    private function exportPdf($data)
    {
        // print_r($data);die;
        try {
            $policyPaymentModes = $data['policyPaymentModes'];
            $totalAmount = $data['totalAmount'];
            $start_date = $data['start_date'];
            $end_date = $data['end_date'];
            $pdf = Pdf::loadView('admin.pdf.month_wise_statement',compact('policyPaymentModes','totalAmount','start_date','end_date'));
            return $pdf->download('Month Wise Statement.pdf');
        } catch (\Exception $e) {
            return back()->with('error','An error occurred while generating the PDF. '.$e->getMessage());
        }
    }

    public function getMonthWiseStatementview(){
        $data['title'] = 'Month Statement';
        return view('admin.cashbook.month_statement')->with($data);
    }

    public function month_wise_statement(Request $request)
    {
        $button = $request->input('button');
        if($button == 'download'){
            return $this->exportMonthStatementPdf($request);
        }
        $selectedMonth = $request->input('month', now()->month); // Default to current month if not selected
        $selectedYear = $request->input('year', now()->year);    // You can hardcode or allow year selection too

        // Calculate the first and last day of the selected month
        $startDate = date("Y-m-01", strtotime("$selectedYear-$selectedMonth-01"));
        $endDate = date("Y-m-t", strtotime("$selectedYear-$selectedMonth-01")); // 't' gives last day of month

        // This gives for example:
        // If selectedMonth = 3 (March) and year = 2025:
        // $startDate = 2025-03-01
        // $endDate = 2025-03-31

        // Now pass these to your calculation function:
        $statements = $this->getMonthWiseStatement($startDate, $endDate);

        return view("admin.cashbook.month_statement", [
            'title' => 'Month Statement',
            'selectedMonth' => $selectedMonth,
            'selectedYear' => $selectedYear,
            'statements' => $statements,
            'start_date' => $startDate,
            'end_date' => $endDate,
        ]);
    }


    // public function getMonthWiseStatement($startDate, $endDate)
    // {
    //     $customers = DB::table('customers')
    //         ->join('policy_payment_modes', 'customers.id', '=', 'policy_payment_modes.customer_id')
    //         ->whereBetween('policy_payment_modes.payment_date', [$startDate, $endDate])
    //         ->select('customers.id', 'customers.name')
    //         ->groupBy('customers.id', 'customers.name')
    //         ->get();

    //     $statements = [];

    //     foreach ($customers as $customer) {
    //         $customerId = $customer->id;

    //         // Previous month's closing balance = opening balance for this month
    //         $previousMonthEndDate = date('Y-m-d', strtotime('-1 day', strtotime($startDate)));

    //         $openingBalance = $this->getClosingBalanceForDate($customerId, $previousMonthEndDate);

    //         // Total deposit within the selected month
    //         $cashDeposited = DB::table('policy_payment_modes')
    //             ->where('customer_id', $customerId)
    //             ->whereBetween('payment_date', [$startDate, $endDate])
    //             ->sum('amount');

    //         // Closing balance = opening + deposits (you can add withdrawals if needed)
    //         $closingBalance = $openingBalance + $cashDeposited;

    //         $statements[] = [
    //             'customer_id' => $customerId,
    //             'customer_name' => $customer->name,
    //             'opening_balance' => $openingBalance,
    //             'cash_deposited' => $cashDeposited,
    //             'closing_balance' => $closingBalance,
    //         ];
    //     }

    //     return $statements;
    // }

    // private function getClosingBalanceForDate($customerId, $date)
    // {
    //     return DB::table('policy_payment_modes')
    //         ->where('customer_id', $customerId)
    //         ->whereDate('payment_date', '<=', $date)
    //         ->sum('amount');
    // }

    // public function getMonthWiseStatement($startDate, $endDate) //comanted on 12-06-2025
    // {
    //     $customers = DB::table('customers')
    //         ->join('policy_payment_modes', 'customers.id', '=', 'policy_payment_modes.customer_id')
    //         ->whereBetween('policy_payment_modes.payment_date', [$startDate, $endDate])
    //         ->select('customers.id', 'customers.name')
    //         ->groupBy('customers.id', 'customers.name')
    //         ->get();

    //     $statements = [];

    //     foreach ($customers as $customer) {
    //         $customerId = $customer->id;

    //         // Previous month's closing balance (acts as opening balance for this month)
    //         $previousMonthEndDate = date('Y-m-d', strtotime('-1 day', strtotime($startDate)));
    //         $openingBalance = $this->calculateClosingBalance($customerId, $previousMonthEndDate);

    //         // Credits (Deposits from customer to me) - policy_payment_modes
    //         $cashDeposited = DB::table('policy_payment_modes')
    //             ->where('customer_id', $customerId)
    //             ->whereBetween('payment_date', [$startDate, $endDate])
    //             ->sum('amount');

    //         // Debits (Payments I made to policy) - policys_payments
    //         $cashPaidToPolicy = DB::table('policys_payments')
    //             ->where('customer_id', $customerId)
    //             ->whereBetween('payment_date', [$startDate, $endDate])
    //             ->sum('amount');

    //         // Calculate closing balance
    //         $closingBalance = $openingBalance + $cashDeposited - $cashPaidToPolicy;

    //         // Only add to statement if closing balance is positive
    //         if ($closingBalance > 0) {
    //             $statements[] = [
    //                 'customer_id' => $customerId,
    //                 'customer_name' => $customer->name,
    //                 'opening_balance' => $openingBalance,
    //                 'cash_deposited' => $cashDeposited,
    //                 'cash_paid_to_policy' => $cashPaidToPolicy,
    //                 'closing_balance' => $closingBalance,
    //             ];
    //         }
    //     }

    //     return $statements;
    // }

    public function getMonthWiseStatement($startDate, $endDate) //ready on 12-06-2025
    {
        // Get all customers who have ever had any transaction (payment or deposit)
        // or you might want all customers regardless - depends on your business logic
        $customers = DB::table('customers')
            ->select('id', 'name')
            ->get();

        $statements = [];

        foreach ($customers as $customer) {
            $customerId = $customer->id;

            // Previous month's closing balance (acts as opening balance for this month)
            $previousMonthEndDate = date('Y-m-d', strtotime('-1 day', strtotime($startDate)));
            $openingBalance = $this->calculateClosingBalance($customerId, $previousMonthEndDate);

            // Credits (Deposits from customer to me) - policy_payment_modes
            $cashDeposited = DB::table('policy_payment_modes')
                ->where('customer_id', $customerId)
                ->whereBetween('payment_date', [$startDate, $endDate])
                ->sum('amount') ?? 0;

            // Debits (Payments I made to policy) - policys_payments
            $cashPaidToPolicy = DB::table('policys_payments')
                ->where('customer_id', $customerId)
                ->whereBetween('payment_date', [$startDate, $endDate])
                ->sum('amount') ?? 0;

            // Calculate closing balance
            $closingBalance = $openingBalance + ($cashDeposited - $cashPaidToPolicy);

            // Add to statement regardless of closing balance (remove the if condition)
            if ($closingBalance >= 0) {
                $statements[] = [
                    'customer_id' => $customerId,
                    'customer_name' => $customer->name,
                    'opening_balance' => $openingBalance,
                    'cash_deposited' => $cashDeposited,
                    'cash_paid_to_policy' => $cashPaidToPolicy,
                    'closing_balance' => $closingBalance,
                    'had_activity' => ($cashDeposited > 0 || $cashPaidToPolicy > 0) // Flag to indicate if there was any activity
                ];
            }
        }

        return $statements;
    }

    private function exportMonthStatementPdf(Request $request)
    {
        // print_r($data);die;
        try {
            $selectedMonth = $request->input('month', now()->month); // Default to current month if not selected
            $selectedYear = $request->input('year', now()->year);    // You can hardcode or allow year selection too

            // Calculate the first and last day of the selected month
            $startDate = date("Y-m-01", strtotime("$selectedYear-$selectedMonth-01"));
            $endDate = date("Y-m-t", strtotime("$selectedYear-$selectedMonth-01")); // 't' gives last day of month

            // Now pass these to your calculation function:
            $statements = $this->getMonthWiseStatement($startDate, $endDate);

            $pdf = Pdf::loadView("admin.pdf.month_statement", [
                'title' => 'Customer Total Statement',
                'selectedMonth' => $selectedMonth,
                'selectedYear' => $selectedYear,
                'statements' => $statements,
                'start_date' => $startDate,
                'end_date' => $endDate,
            ]);
            return $pdf->download('Customer Total Statement.pdf');
        } catch (\Exception $e) {
            return back()->with('error','An error occurred while generating the PDF. '.$e->getMessage());
        }
    }

    /**
     * Calculate closing balance up to a given date.
     */
    private function calculateClosingBalance($customerId, $date)
    {
        $totalCredits = DB::table('policy_payment_modes')
            ->where('customer_id', $customerId)
            ->whereDate('payment_date', '<=', $date)
            ->sum('amount');

        $totalDebits = DB::table('policys_payments')
            ->where('customer_id', $customerId)
            ->whereDate('payment_date', '<=', $date)
            ->sum('amount');

        return $totalCredits - $totalDebits;
    }




}


