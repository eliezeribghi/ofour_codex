<?php

namespace App\Http\Controllers;

use App\Models\Categorie;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {
        // Récupérer toutes les catégories
        return Categorie::all(); // Retourne un JSON avec toutes les catégories
    }
}
