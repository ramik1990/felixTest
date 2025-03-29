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
        Schema::create('cart_knife', function (Blueprint $table) {
            $table->id();
            $table->string('session_id');
            $table->foreignIdFor(App\Models\Cart::class)->constrained()->onDelete('cascade');
            $table->foreignIdFor(App\Models\Knife::class)->constrained()->onDelete('cascade');
            $table->integer('quantity')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cart_knife');
    }
};
