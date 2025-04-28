<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use App\Models\Customer;
use Barryvdh\DomPDF\Facade\PDF;

class CustomerStatements extends Controller
{

    public function index()
    {
        $data['title'] = 'Customer Statements';
        $data['customers'] = Customer::all();
        $data['statements'] = [];
        $data['download_url'] = 'javascript:void(0)';
        $data['customer_id'] = 0;
        $data['start_date'] = '';
        $data['end_date'] = '';
        return view('admin.customer_statements.index')->with($data);
    }

    public function store(Request $request)
    {
        $data['title'] = 'Customer Statements';
        $data['customers'] = Customer::all();
        $startDate = Carbon::createFromFormat('d M, Y', $request->start)->format('Y-m-d');
        $endDate = Carbon::createFromFormat('d M, Y', $request->end)->format('Y-m-d');
        if($request->button == 'get_statement'){
            $data['statements'] = $this->getStatement($startDate,$endDate,$request->customer_id);
    
            $data['customer_id'] = $request->customer_id;
            $data['start_date'] = $request->start;
            $data['end_date'] = $request->end;
            $data['download_url'] = url('download-statement/'.$request->customer_id.'/'.$startDate.'/'.$endDate);
            return view('admin.customer_statements.index')->with($data);
        }else{
            $data['statements'] = $this->getStatement($startDate,$endDate,$request->customer_id);
            $data['customer_name'] = Customer::where('id',$request->customer_id)->value('name');
            $data['customer_id'] = Customer::where('id',$request->customer_id)->value('customer_id');
            // $filename = 'receipt_' . time() . '.pdf';
            // $pdf = PDF::loadView('admin.customer_statements.statement', $data);
            // return $pdf->download($filename);
            return view('admin.customer_statements.statement')->with($data);
        }
    }


    // v- 0.01
    // protected function getStatement($startDate, $endDate, $customer_id) {
    //     $payments = DB::table('policy_payment_modes')
    //                 ->where('customer_id',$customer_id)
    //                 ->whereDate('payment_date', '>=', $startDate)
    //                 ->whereDate('payment_date', '<=', $endDate)
    //                 ->orderBy('payment_date')
    //                 ->get();
    
    //     $closingBalance = 0;
    //     $statement = [];
    
    //     foreach ($payments as $payment) {
    //         $debit = 0;
    //         $credit = $payment->amount;
            
    //         $closingBalance += $credit;

    //         $statement[] = [
    //             'date' => $payment->payment_date,
    //             'narration' => $payment->remarks,
    //             'debit' => $debit,
    //             'credit' => $credit,
    //             'closing_balance' => $closingBalance
    //         ];
    //     }
    
    //     return $statement;
    // }

    // v- 0.02
    protected function getStatement($startDate, $endDate, $customer_id) {
        // Get credits from policy_payment_modes
        $credits = DB::table('policy_payment_modes')
                    ->select('payment_date', 'remarks', 'amount', DB::raw('"credit" as type'))
                    ->where('customer_id', $customer_id)
                    ->whereDate('payment_date', '>=', $startDate)
                    ->whereDate('payment_date', '<=', $endDate)
                    ->orderBy('payment_date');
    
        // Get debits from policys_payments
        $debits = DB::table('policys_payments')
                    ->select('payment_date', 'remarks', 'amount', DB::raw('"debit" as type'))
                    ->where('customer_id', $customer_id)
                    ->whereDate('payment_date', '>=', $startDate)
                    ->whereDate('payment_date', '<=', $endDate)
                    ->orderBy('payment_date');
    
        // Combine debits and credits
        $transactions = $debits->union($credits)
                              ->orderBy('payment_date')
                              ->get();
    
        $closingBalance = 0;
        $statement = [];
    
        foreach ($transactions as $transaction) {
            $debit = $transaction->type == 'debit' ? $transaction->amount : 0;
            $credit = $transaction->type == 'credit' ? $transaction->amount : 0;
    
            $closingBalance += $credit - $debit;
    
            $statement[] = [
                'date' => $transaction->payment_date,
                'narration' => $transaction->remarks,
                'debit' => $debit,
                'credit' => $credit,
                'closing_balance' => $closingBalance
            ];
        }
    
        return $statement;
    }
    

    public function download_statement($customer_id, $startDate, $endDate){
        $data['statements'] = $this->getStatement($startDate, $endDate, $customer_id);
        $data['customer_name'] = Customer::where('id',$customer_id)->value('name');
        $data['customer_id'] = Customer::where('id',$customer_id)->value('customer_id');
        print_r($data); die;
        $filename = 'receipt_' . time() . '.pdf';
        $pdf = PDF::loadView('admin.customer_statements.statement', $data);
        return $pdf->download($filename);
    }
}
