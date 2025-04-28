<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('policy_payment_modes', function (Blueprint $table) {
            $table->id();
            $table->string('policy_number');
            $table->unsignedBigInteger('customer_id');
            $table->decimal('amount', 10, 2)->nullable();
            $table->string('payment_mode')->nullable();
            $table->string('refference_number')->nullable();
            // $table->string('acknowledgement_receipt')->nullable();
            $table->timestamp('payment_date')->nullable();
             $table->string('remarks')->nullable();
            $table->timestamps();
            $table->foreign('customer_id')->references('id')->on('customers')->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('policy_payment_modes');
    }
};
