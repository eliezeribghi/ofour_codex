<?php
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\CategoryController;

use App\Http\Controllers\RecetteController;
use App\Http\Controllers\IngredientController;
use App\Models\Ingredient;
use Illuminate\Http\Request;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
// Route pour afficher les détails d'une recette


Route::get('categories', [CategoryController::class, 'index']); // Récupérer les catégories
Route::get('/recettes', [RecetteController::class, 'list']);
Route::get('/ingredients', [IngredientController::class, 'list']);
Route::get('/recettes/{id}', [RecetteController::class, 'show']);
Route::post('/recettes', [RecetteController::class, 'store']);
