<?php

use Illuminate\Support\Facades\Route;

//============== Admin use ========================
use App\Http\Controllers\Admin\Admin;
use App\Http\Controllers\Admin\Customers;
use App\Http\Controllers\Admin\DuePayments;
use App\Http\Controllers\Admin\Policy;
use App\Http\Controllers\Admin\Settings;
use App\Http\Controllers\Admin\FrequancyController;
use App\Http\Controllers\Admin\PolicytermsController;
use App\Http\Controllers\Admin\PolicytypeController;
use App\Http\Controllers\Admin\PolicyPaymentModeController;
use App\Http\Controllers\Admin\PolicyController;
use App\Http\Controllers\Admin\PaymentController;
use App\Http\Controllers\Admin\AreaController;
use App\Http\Controllers\Admin\ReportController;
use App\Http\Controllers\Admin\PolicysPaymentController;
use App\Http\Controllers\Admin\CustomerStatements;
use App\Http\Controllers\Admin\AgentController;

//===================================================

Route::get('/', function () {
    return redirect(route('login'));
});

Route::get('/test-pdf', function () {
    $data = ['message' => 'Hello, World!'];
    $pdf = PDF::loadView('test_view', $data);
    return $pdf->download('test.pdf');
});

//====================== Admin Panel Routes =======================


//======================= Admin Login Routes =====================

Route::get("/register-user",[Admin::class,"register_user"]);
Route::get("/login",[Admin::class,"login"])->name("login");
Route::post("/checkuser",[Admin::class,"checkuser"]);


Route::middleware('auth.admin')->group(function () {

    Route::get("/logout",[Admin::class,"logout"]);
    Route::get("/changepass",[Admin::class,"change_password"]);
    Route::post("/changep",[Admin::class,"change_pass"]);

    //======================= Admin Dashboard Routes ======================
    Route::prefix('dashboard')->group(function () {
        Route::get("/",[Admin::class,"dashboard"])->name('dashboard');


        //======================= Settings Routes ======================
        Route::prefix('settings')->group(function () {
            Route::get("/",[Settings::class,"content"])->name('settings');
            Route::post("/add",[Settings::class,"add_content"])->name('settings.add');
        });


        //============================ Customer Routes ==============================
        Route::prefix('customer')->group(function () {
            Route::get("/",[Customers::class,"index"])->name('customer');
            Route::get("/add",[Customers::class,"add_customer"])->name('customer.add');
            Route::post("/add/process",[Customers::class,"process"])->name('customer.process');
            Route::get("/edit/{id}", [Customers::class, "edit"])->name('customer.edit');
            Route::post("/update/{id}", [Customers::class, "update"])->name('customer.update');
            Route::get("/delete/{id}", [Customers::class, "delete"])->name('customer.delete');

            Route::post("/get-customer-image", [Customers::class, "get_customer_image"])->name('customer.get-customer-image');
        });

        Route::prefix('agent')->group(function () {
            Route::get("/",[AgentController::class,"index"])->name('agent');
            Route::get("/add",[AgentController::class,"add_agent"])->name('agent.add');
            Route::post("/add/process",[AgentController::class,"process"])->name('agent.process');
            Route::get("/edit/{id}", [AgentController::class, "edit"])->name('agent.edit');
            Route::post("/update/{id}", [AgentController::class, "update"])->name('agent.update');
            Route::get("/delete/{id}", [AgentController::class, "delete"])->name('agent.delete');
        });

        Route::prefix('policy')->group(function () {
            Route::get("/policy",[PolicyController::class,"index"])->name('policy');
            Route::get("/policy/add",[PolicyController::class,"add"])->name('policy.add');
            Route::post("/policy/add/process",[PolicyController::class,"process"])->name('policy.process');
            Route::get("/policy/edit/{id}", [PolicyController::class, "edit"])->name('policy.edit');
            Route::post("/policy/update/{id}", [PolicyController::class, "update"])->name('policy.update');
            Route::get("/policy/delete/{id}", [PolicyController::class, "delete"])->name('policy.delete');
        });

        Route::prefix('due-payment')->group(function () {
            Route::controller(DuePayments::class)->group(function () {
                Route::get('/','index')->name('due-payment.index');
                Route::get('export-to-pdf','exportPdf')->name('due-payment.pdf');
            });
        });

        Route::prefix('policy-payment')->group(function () {
            Route::get("/policy-payment",[PaymentController::class,"index"])->name('policy-payment');
            Route::get("/policy-payment/add",[PaymentController::class,"add"])->name('policy-payment.add');
            Route::get("/policy-payment/get-policies/{id}",[PaymentController::class,"get_policy_by_customer"])->name('policy-payment.get.policy');
            Route::post("/policy/add/process",[PaymentController::class,"process"])->name('policy-payment.process');
            Route::get("/policy/edit/{id}", [PaymentController::class, "edit"])->name('policy-payment.edit');
            Route::post("/policy/update/{id}", [PaymentController::class, "update"])->name('policy-payment.update');
            Route::get("/policy/delete/{id}", [PaymentController::class, "delete"])->name('policy-payment.delete');
            Route::get("/receipt/{id}", [PaymentController::class, "receipt"])->name('policy-payment.receipt');
            Route::get("/receipt-download/{id}", [PaymentController::class, "download"])->name('policy-payment.download');
            // Route::get("/generateTicket", [PaymentController::class, "generateTicket"])->name('generateTicket');

        });

        Route::resource('bank-policy-payment',PolicysPaymentController::class);
        Route::get('/{id}/payment-receipt',[PolicysPaymentController::class,"receipt"])->name('bank-policy-payment.receipt');
        Route::resource('customer-statement',CustomerStatements::class);
        Route::get('download-statement/{customer_id}',[CustomerStatements::class,'download_statement']);

        Route::get('/reports/area-wise', [ReportController::class, 'areaWiseStatement'])->name('reports.areaWiseStatement');
        Route::get('reports/fetch-area-data', [ReportController::class, 'fetchAreaData'])->name('reports.fetchAreaData');
        Route::get('/reports/daily-cashbook', [ReportController::class, 'dailyCashbook'])->name('reports.dailyCashbook');
        Route::get('/reports/area-wise-agent-list', [ReportController::class, 'areaWiseAgentList'])->name('reports.areaWiseAgentList');
         //@@@@@@@@@@@@@ DailyCashbook @@@@@@@@@@//
        Route::get('/reports/all_transaction', [ReportController::class, 'all_transaction'])->name('reports.all_transaction');
        Route::get('/reports/cash-in-hand', [ReportController::class, 'cash_in_hand'])->name('reports.cash_in_hand');
        Route::get('/reports/transaction', [ReportController::class, 'transaction'])->name('reports.transaction');
        Route::get('/reports/month-wise', [ReportController::class, 'month_wise'])->name('reports.month');
        
        Route::get('/reports/month-wise-statement', [ReportController::class, 'getMonthWiseStatementview'])->name('reports.month-statement-view');
        Route::post('/reports/month-wise-statement', [ReportController::class, 'month_wise_statement'])->name('reports.month-statement');

        Route::prefix('policy-terms')->group(function () {
            Route::get("/policy-terms",[PolicytermsController::class,"index"])->name('policy-terms.index');
            Route::get("/add",[PolicytermsController::class,"add"])->name('policy-terms.add');
            Route::post("/add/process",[PolicytermsController::class,"process"])->name('policy-terms.process');
            Route::get("/edit/{id}", [PolicytermsController::class, "edit"])->name('policy-terms.edit');
            Route::post("/update/{id}", [PolicytermsController::class, "update"])->name('policy-terms.update');
            Route::get("/delete/{id}", [PolicytermsController::class, "delete"])->name('policy-terms.delete');
        });

        Route::prefix('policy_master')->group(function () {
            Route::get("/frequency-master",[FrequancyController::class,"index"])->name('frequency.policy');
            Route::get("/add",[FrequancyController::class,"add"])->name('frequency.add');
            Route::post("/add/process",[FrequancyController::class,"process"])->name('frequency.process');
            Route::get("/edit/{id}", [FrequancyController::class, "edit"])->name('frequency.edit');
            Route::post("/update/{id}", [FrequancyController::class, "update"])->name('frequency.update');
            Route::get("/delete/{id}", [FrequancyController::class, "delete"])->name('frequency.delete');

            Route::get("/policy-type-master",[PolicytypeController::class,"index"])->name('policy-type');
            Route::get("/policy-type/add",[PolicytypeController::class,"add"])->name('policy-type.add');
            Route::post("/policy-type/add/process",[PolicytypeController::class,"process"])->name('policy-type.process');
            Route::get("/policy-type/edit/{id}", [PolicytypeController::class, "edit"])->name('policy-type.edit');
            Route::post("/policy-type/update/{id}", [PolicytypeController::class, "update"])->name('policy-type.update');
            Route::get("/policy-type/delete/{id}", [PolicytypeController::class, "delete"])->name('policy-type.delete');

            Route::get("/payment-master",[PolicyPaymentModeController::class,"index"])->name('payment');
            Route::get("/payment/add",[PolicyPaymentModeController::class,"add"])->name('payment.add');
            Route::post("/payment/add/process",[PolicyPaymentModeController::class,"process"])->name('payment.process');
            Route::get("/payment/edit/{id}", [PolicyPaymentModeController::class, "edit"])->name('payment.edit');
            Route::post("/payment/update/{id}", [PolicyPaymentModeController::class, "update"])->name('payment.update');
            Route::get("/payment/delete/{id}", [PolicyPaymentModeController::class, "delete"])->name('payment.delete');

            Route::get("/area-master",[AreaController::class,"index"])->name('area');
            Route::get("/area/add",[AreaController::class,"add"])->name('area.add');
            Route::post("/area/add/process",[AreaController::class,"process"])->name('area.process');
            Route::get("/area/edit/{id}", [AreaController::class, "edit"])->name('area.edit');
            Route::post("/area/update/{id}", [AreaController::class, "update"])->name('area.update');
            Route::get("/area/delete/{id}", [AreaController::class, "delete"])->name('area.delete');
        });
    });
});
