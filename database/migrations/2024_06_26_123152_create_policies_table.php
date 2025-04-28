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
        Schema::create('policies', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('policy_no');
            $table->unsignedBigInteger('customer_id');
            $table->string('policy_type')->nullable();
            $table->string('policy_term')->nullable();
            $table->decimal('sum_assured', 10, 2)->nullable();
            $table->date('maturity_date')->nullable();
            $table->string('nominee_name')->nullable();
            $table->string('nominee_relationship')->nullable();
            $table->string('nominee_contact_number')->nullable();
            $table->decimal('premium_amount', 10, 2)->nullable();
            $table->string('frequency')->nullable();
            $table->date('due_date')->nullable();
            $table->string('status')->nullable();
            $table->timestamps();


        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('policies');
    }
};
