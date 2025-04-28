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
        Schema::create('policys_payments', function (Blueprint $table) {
            $table->id();
            $table->string('policy_number')->nullable();
            $table->unsignedBigInteger('customer_id');
            $table->decimal('amount',10,2)->nullable();
            $table->unsignedBigInteger('payment_mode');
            $table->string('refference_number')->nullable();
            $table->timestamp('payment_date')->nullable();
            $table->text('remarks')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('policys_payments');
    }
};
