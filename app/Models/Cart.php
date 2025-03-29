<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;

    protected $table = 'carts';
    protected $guarded = [];

    public function knives() {
        return $this->belongsToMany(Knife::class, 'cart_knife')->withPivot('quantity');
    }
}
