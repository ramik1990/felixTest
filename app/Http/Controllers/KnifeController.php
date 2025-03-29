<?php

namespace App\Http\Controllers;

use App\Models\Knife;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;



class KnifeController extends Controller
{


    public function uploadKnife(Request $request) {
        
        $knife = new Knife();
        $knife->title = $request->title;
        $knife->description = $request->description;
        if($request->hasFile('file')) {
            $path = $request->file('file')->store('knifes', 'public');
            $knife->imageUrl = $path;
        }
        $knife->save();
        return response()->json(['message' => 'Нож добавлен!', 'knife' => $knife], 201);
    }

    public function getKnives(Request $request) {
        $knives = Knife::select('id', 'title', 'description', 'price', 'imageUrl', 'created_at')
        ->orderBy('created_at', 'desc') 
        ->paginate(10); 
        // Форматируем путь к изображению
        $knives->getCollection()->transform(function ($knife) {
            if ($knife->imageUrl) {
                $knife->imageUrl = asset('storage/' . $knife->imageUrl);
            }
            return $knife;
        });

        return response()->json($knives);
    }
}
