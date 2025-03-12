<?php

namespace App\Http\Controllers;

use App\Models\Ingredient;
use Illuminate\Http\Request;

class ingredientController extends Controller
{
    public function list()
    {
        try {
            // Récupérez tous les ingrédients avec leurs recettes associées
            $ingredients = Ingredient::with('recettes')->get();

            // Retournez les données sous forme de réponse JSON
            return response()->json($ingredients);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erreur lors de la récupération des ingrédients.'], 500);
        }
    }
}
