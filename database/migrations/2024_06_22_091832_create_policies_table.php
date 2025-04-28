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
            $table->string('policy_type')->nullable();
            $table->string('policy_term')->nullable();
            $table->decimal('sum_assured', 10, 2)->nullable();
            $table->date('maturity_date')->nullable();
            $table->string('nominee_name')->nullable();
            $table->string('nominee_relationship')->nullable();
            $table->string('nominee_contact_number')->nullable();
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
