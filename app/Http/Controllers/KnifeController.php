<?php

namespace App\Http\Controllers;

use App\Models\Knife;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;



class KnifeController extends Controller
{
    protected $table = 'knives';
    protected $guarded = [];

    public function uploadKnife(Request $request) {
        
        $knife = new Knife();
        $knife->title = $request->title;
        $knife->description = $request->description;
        if($request->hasFile('file')) {
            $path = $request->file('file')->store('knifes', 'public');
            $knife->imageUrl = $path;
        }
        $knife->save();
        return response()->json(['message' => 'Нож добавлен!', 'knife' => $knife, 'imageUrl' => public_path('storage/'.$path)], 201);
    }
}
