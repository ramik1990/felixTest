<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Knife extends Model
{
    use HasFactory;
    protected $table = 'knives';
    protected $guarded = [];

    public function carts() {
        return $this->belongsToMany(Cart::class, 'cart_knife')->withPivot('quantity');
    }
}
