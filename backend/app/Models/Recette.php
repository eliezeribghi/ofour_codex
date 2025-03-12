<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\EtapePreparation;
use App\Models\RecetteIngredient;
use App\Models\Categorie;
use App\Models\Ingredient; // ✅ Ajout de l'import manquant

class Recette extends Model
{
    use HasFactory;

    protected $table = 'recettes';

    protected $fillable = [
        'titre',
        'categorie_id',
        'image_url',
        'contenu',
        'temps_preparation',
        'temps_cuisson',
        'niveau_difficulte',
        'note_moyenne',
    ];

  
    public function ingredients()
    {
        return $this->belongsToMany(Ingredient::class, 'recette_ingredients', 'recette_id', 'ingredient_id')
            ->withPivot('quantite')
            ->withTimestamps();
    }

    public function etapesPreparation()
    {
        return $this->hasMany(EtapePreparation::class);
    }

    public function recetteIngredients()
    {
        return $this->hasMany(RecetteIngredient::class);
    }

    public function categorie()
    {
        return $this->belongsTo(Categorie::class);
    }
}
