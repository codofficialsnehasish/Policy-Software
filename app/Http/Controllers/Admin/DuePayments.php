<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\PaymentMode;

use Barryvdh\DomPDF\Facade\Pdf;

class DuePayments extends Controller
{
    // public function index(){
    //     $data['title'] = 'Due Payments';

    //     $creditSubquery = DB::table('policy_payment_modes')
    //         ->select('policy_number', 'customer_id', DB::raw('SUM(amount) AS total_credit'))
    //         ->whereNotNull('policy_number')
    //         ->groupBy('policy_number', 'customer_id');
        


    //     $debitSubquery = DB::table('policys_payments')
    //         ->select('policy_number', 'customer_id', DB::raw('SUM(amount) AS total_debit'))
    //         ->whereNotNull('policy_number')
    //         ->groupBy('policy_number', 'customer_id');


    //     $data['alldata'] = DB::table(DB::raw("({$creditSubquery->toSql()}) AS c"))
    //         ->mergeBindings($creditSubquery)
    //         ->rightJoin(DB::raw("({$debitSubquery->toSql()}) AS d"), function ($join) {
    //             $join->on('c.policy_number', '=', 'd.policy_number')
    //                  ->on('c.customer_id', '=', 'd.customer_id');
    //         })
    //         ->select(
    //             DB::raw('COALESCE(c.policy_number, d.policy_number) AS policy_number'),
    //             DB::raw('COALESCE(c.customer_id, d.customer_id) AS customer_id'),
    //             DB::raw('COALESCE(SUM(c.total_credit), 0) AS total_credit'),  // Use SUM here
    //             DB::raw('COALESCE(SUM(d.total_debit), 0) AS total_debit'),    // Use SUM here
    //             // DB::raw('CASE WHEN COALESCE(SUM(d.total_debit), 0) = 0 THEN 0 ELSE ABS(COALESCE(SUM(c.total_credit), 0) - COALESCE(SUM(d.total_debit), 0)) END AS balance')
    //             DB::raw('CASE 
    //                         WHEN COALESCE(SUM(c.total_credit), 0) >= COALESCE(SUM(d.total_debit), 0) THEN 0 
    //                         ELSE ABS(COALESCE(SUM(c.total_credit), 0) - COALESCE(SUM(d.total_debit), 0)) 
    //                     END AS balance')

    //         )
    //         ->groupBy(
    //             DB::raw('COALESCE(c.policy_number, d.policy_number)'),
    //             DB::raw('COALESCE(c.customer_id, d.customer_id)')
    //         )
    //         ->havingRaw('ABS(COALESCE(SUM(c.total_credit), 0) - COALESCE(SUM(d.total_debit), 0)) > 0') // Check for non-zero balance
    //         ->havingRaw('balance > 0')
    //         ->havingRaw('SUM(d.total_debit) > 0') // Ensure total debit is greater than 0
    //         ->distinct()
    //         ->get();
        
    //     // $data['alldata'] = DB::table(DB::raw("({$debitSubquery->toSql()}) AS d"))
    //     //     ->mergeBindings($debitSubquery)
    //     //     ->leftJoin(DB::raw("({$creditSubquery->toSql()}) AS c"), function ($join) {
    //     //         $join->on('c.policy_number', '=', 'd.policy_number')
    //     //             ->on('c.customer_id', '=', 'd.customer_id');
    //     //     })
    //     //     ->select(
    //     //         DB::raw('d.policy_number'),
    //     //         DB::raw('d.customer_id'),
    //     //         DB::raw('COALESCE(SUM(d.total_debit), 0) AS total_debit'),    // Use SUM for total_debit
    //     //         DB::raw('COALESCE(SUM(c.total_credit), 0) AS total_credit'),  // Use SUM for total_credit
    //     //         DB::raw('ABS(COALESCE(SUM(c.total_credit), 0) - COALESCE(SUM(d.total_debit), 0)) AS balance')
    //     //     )
    //     //     ->whereNull('c.policy_number') // Filter to include only those without corresponding credit entries
    //     //     ->groupBy(
    //     //         'd.policy_number',
    //     //         'd.customer_id'
    //     //     )
    //     //     ->havingRaw('SUM(d.total_debit) > 0') // Ensure total debit is greater than 0
    //     //     ->distinct()
    //     //     ->get();




        
    //     return view('admin.due_payments.index')->with($data);
    // }
    
    public function index(){
        $data['title'] = 'Due Payments';

        $creditSubquery = DB::table('policy_payment_modes')
            ->select('customer_id', DB::raw('SUM(amount) AS total_credit'))
            // ->whereNotNull('policy_number')
            ->groupBy('customer_id');
        


        $debitSubquery = DB::table('policys_payments')
            ->select('customer_id', DB::raw('SUM(amount) AS total_debit'))
            // ->whereNotNull('policy_number')
            ->groupBy('customer_id');


        $data['alldata'] = DB::table(DB::raw("({$creditSubquery->toSql()}) AS c"))
            ->mergeBindings($creditSubquery)
            ->rightJoin(DB::raw("({$debitSubquery->toSql()}) AS d"), function ($join) {
                // $join->on('c.policy_number', '=', 'd.policy_number')
                $join->on('c.customer_id', '=', 'd.customer_id');
            })
            ->select(
                // 'd.policy_number',
                // DB::raw('COALESCE(c.policy_number, d.policy_number) AS policy_number'),
                DB::raw('COALESCE(c.customer_id, d.customer_id) AS customer_id'),
                DB::raw('COALESCE(SUM(c.total_credit), 0) AS total_credit'),  // Use SUM here
                DB::raw('COALESCE(SUM(d.total_debit), 0) AS total_debit'),    // Use SUM here
                // DB::raw('CASE WHEN COALESCE(SUM(d.total_debit), 0) = 0 THEN 0 ELSE ABS(COALESCE(SUM(c.total_credit), 0) - COALESCE(SUM(d.total_debit), 0)) END AS balance')
                DB::raw('CASE 
                            WHEN COALESCE(SUM(c.total_credit), 0) >= COALESCE(SUM(d.total_debit), 0) THEN 0 
                            ELSE ABS(COALESCE(SUM(c.total_credit), 0) - COALESCE(SUM(d.total_debit), 0)) 
                        END AS balance')

            )
            ->groupBy(
                // 'd.policy_number',
                // DB::raw('COALESCE(c.policy_number, d.policy_number)'),
                DB::raw('COALESCE(c.customer_id, d.customer_id)')
            )
            ->havingRaw('ABS(COALESCE(SUM(c.total_credit), 0) - COALESCE(SUM(d.total_debit), 0)) > 0') // Check for non-zero balance
            ->havingRaw('balance > 0')
            ->havingRaw('SUM(d.total_debit) > 0') // Ensure total debit is greater than 0
            ->distinct()
            ->get();
        
        return view('admin.due_payments.index')->with($data);
    }


    // public function index(){
    //     $data['title'] = 'Due Payments';

    //     $creditSubquery = DB::table('policy_payment_modes')
    //         ->select('policy_number', 'customer_id', DB::raw('SUM(amount) AS total_credit'))
    //         ->whereNotNull('policy_number')
    //         ->groupBy('policy_number', 'customer_id');

    //     // Subquery for total debit
    //     $debitSubquery = DB::table('policys_payments')
    //         ->select('policy_number', 'customer_id', DB::raw('SUM(amount) AS total_debit'))
    //         ->whereNotNull('policy_number')
    //         ->groupBy('policy_number', 'customer_id');

    //     // Perform LEFT JOIN to combine credit and debit data
    //     $data['alldata'] = DB::table(DB::raw("({$creditSubquery->toSql()}) AS c"))
    //         ->mergeBindings($creditSubquery)
    //         ->leftJoin(DB::raw("({$debitSubquery->toSql()}) AS d"), function ($join) {
    //             $join->on('c.policy_number', '=', 'd.policy_number')
    //                 ->on('c.customer_id', '=', 'd.customer_id');
    //         })
    //         ->select(
    //             DB::raw('COALESCE(c.policy_number, d.policy_number) AS policy_number'),
    //             DB::raw('COALESCE(c.customer_id, d.customer_id) AS customer_id'),
    //             DB::raw('COALESCE(c.total_credit, 0) AS total_credit'),
    //             DB::raw('COALESCE(d.total_debit, 0) AS total_debit'),
    //             DB::raw('CASE WHEN COALESCE(d.total_debit, 0) = 0 THEN 0 ELSE ABS(COALESCE(c.total_credit, 0) - COALESCE(d.total_debit, 0)) END AS balance')
    //             // DB::raw('COALESCE(c.total_credit, 0) - COALESCE(d.total_debit, 0) AS balance')
    //         )
    //         ->distinct()
    //         ->get();


    //     return view('admin.due_payments.index')->with($data);
    // }


    public function exportPdf(Request $request)
    {
        try {

            // $creditSubquery = DB::table('policy_payment_modes')
            //     ->select('policy_number', 'customer_id', DB::raw('SUM(amount) AS total_credit'))
            //     ->whereNotNull('policy_number')
            //     ->groupBy('policy_number', 'customer_id');


            // $debitSubquery = DB::table('policys_payments')
            //     ->select('policy_number', 'customer_id', DB::raw('SUM(amount) AS total_debit'))
            //     ->whereNotNull('policy_number')
            //     ->groupBy('policy_number', 'customer_id');


            // $alldata = DB::table(DB::raw("({$creditSubquery->toSql()}) AS c"))
            //     ->mergeBindings($creditSubquery)
            //     ->rightJoin(DB::raw("({$debitSubquery->toSql()}) AS d"), function ($join) {
            //         $join->on('c.policy_number', '=', 'd.policy_number')
            //             ->on('c.customer_id', '=', 'd.customer_id');
            //     })
            //     ->select(
            //         DB::raw('COALESCE(c.policy_number, d.policy_number) AS policy_number'),
            //         DB::raw('COALESCE(c.customer_id, d.customer_id) AS customer_id'),
            //         DB::raw('COALESCE(SUM(c.total_credit), 0) AS total_credit'),  // Use SUM here
            //         DB::raw('COALESCE(SUM(d.total_debit), 0) AS total_debit'),    // Use SUM here
            //         // DB::raw('CASE WHEN COALESCE(SUM(d.total_debit), 0) = 0 THEN 0 ELSE ABS(COALESCE(SUM(c.total_credit), 0) - COALESCE(SUM(d.total_debit), 0)) END AS balance')
            //         DB::raw('CASE 
            //                     WHEN COALESCE(SUM(c.total_credit), 0) >= COALESCE(SUM(d.total_debit), 0) THEN 0 
            //                     ELSE ABS(COALESCE(SUM(c.total_credit), 0) - COALESCE(SUM(d.total_debit), 0)) 
            //                 END AS balance')

            //     )
            //     ->groupBy(
            //         DB::raw('COALESCE(c.policy_number, d.policy_number)'),
            //         DB::raw('COALESCE(c.customer_id, d.customer_id)')
            //     )
            //     ->havingRaw('ABS(COALESCE(SUM(c.total_credit), 0) - COALESCE(SUM(d.total_debit), 0)) > 0') // Check for non-zero balance
            //     ->havingRaw('balance > 0')
            //     ->havingRaw('SUM(d.total_debit) > 0') // Ensure total debit is greater than 0
            //     ->distinct()
            //     ->get();

            $creditSubquery = DB::table('policy_payment_modes')
                ->select('customer_id', DB::raw('SUM(amount) AS total_credit'))
                // ->whereNotNull('policy_number')
                ->groupBy('customer_id');
            
    
    
            $debitSubquery = DB::table('policys_payments')
                ->select('customer_id', DB::raw('SUM(amount) AS total_debit'))
                // ->whereNotNull('policy_number')
                ->groupBy('customer_id');
    
    
            $alldata = DB::table(DB::raw("({$creditSubquery->toSql()}) AS c"))
                ->mergeBindings($creditSubquery)
                ->rightJoin(DB::raw("({$debitSubquery->toSql()}) AS d"), function ($join) {
                    // $join->on('c.policy_number', '=', 'd.policy_number')
                    $join->on('c.customer_id', '=', 'd.customer_id');
                })
                ->select(
                    // 'd.policy_number',
                    // DB::raw('COALESCE(c.policy_number, d.policy_number) AS policy_number'),
                    DB::raw('COALESCE(c.customer_id, d.customer_id) AS customer_id'),
                    DB::raw('COALESCE(SUM(c.total_credit), 0) AS total_credit'),  // Use SUM here
                    DB::raw('COALESCE(SUM(d.total_debit), 0) AS total_debit'),    // Use SUM here
                    // DB::raw('CASE WHEN COALESCE(SUM(d.total_debit), 0) = 0 THEN 0 ELSE ABS(COALESCE(SUM(c.total_credit), 0) - COALESCE(SUM(d.total_debit), 0)) END AS balance')
                    DB::raw('CASE 
                                WHEN COALESCE(SUM(c.total_credit), 0) >= COALESCE(SUM(d.total_debit), 0) THEN 0 
                                ELSE ABS(COALESCE(SUM(c.total_credit), 0) - COALESCE(SUM(d.total_debit), 0)) 
                            END AS balance')
    
                )
                ->groupBy(
                    // 'd.policy_number',
                    // DB::raw('COALESCE(c.policy_number, d.policy_number)'),
                    DB::raw('COALESCE(c.customer_id, d.customer_id)')
                )
                ->havingRaw('ABS(COALESCE(SUM(c.total_credit), 0) - COALESCE(SUM(d.total_debit), 0)) > 0') // Check for non-zero balance
                ->havingRaw('balance > 0')
                ->havingRaw('SUM(d.total_debit) > 0') // Ensure total debit is greater than 0
                ->distinct()
                ->get();

            $pdf = Pdf::loadView('admin.pdf.due',compact('alldata'));
            return $pdf->download('Due Payments.pdf');
        } catch (\Exception $e) {
            return back()->with('error','An error occurred while generating the PDF. '.$e->getMessage());
        }
    }
}