<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Knife;
use Illuminate\Support\Facades\DB;

class CartController extends Controller
{
    //Добавление ножа к корзину
    public function addToCart(Request $request) {
        $knifeId = $request->knife_id;
        $quantity = $request->quantity;

        $cart = Cart::where('is_paid', 0)->where('session_id', session()->getId())->first();
        if(!$cart) {
            $cart = Cart::create([
                'session_id' => session()->getId(),
                'is_paid' => 0
            ]);
        }
        $existingKnife = $cart->knives()->where('knife_id', $knifeId)->first();
        if($existingKnife) {
            $cart->knives()->updateExistingPivot($knifeId, [
                'session_id' => session()->getId(),
                'quantity' => $existingKnife->pivot->quantity + $quantity,
            ]);
        } else {
            $cart->knives()->attach($knifeId, ['session_id' => session()->getId(), 'quantity' => $quantity]);
        }
        return response()->json(['message' => 'Нож добавлен в корзину!', 'quantity' => $quantity]);
    }


    //Просмотр корзины
    public function getCart(Request $request) {
        $cart = Cart::where('session_id', session()->getId())->where('is_paid', 0)->with('knives')->first();
        return $cart;
    }
}
