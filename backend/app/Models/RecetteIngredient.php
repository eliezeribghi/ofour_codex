<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RecetteIngredient extends Model
{
    protected $table = 'recette_ingredients';

    public function ingredient()
    {
        return $this->belongsTo(Ingredient::class, 'ingredient_id');
    }

    public function recette()
    {
        return $this->belongsTo(Recette::class, 'recette_id');
    }
}
