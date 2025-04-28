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
            $table->unsignedBigInteger('policy_id');
            $table->unsignedBigInteger('customer_id');
            $table->decimal('amount', 10, 2)->nullable();
            $table->string('payment_mode')->nullable();
            $table->string('acknowledgement_receipt')->nullable();
            $table->string('remarks')->nullable();
            $table->timestamps();

            $table->foreign('policy_id')->references('id')->on('policies')->onDelete('cascade');
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
