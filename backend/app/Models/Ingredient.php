<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;



class Ingredient extends Model
{
    // ...

    public function recettes(): mixed
    {
        // Déclare une relation many-to-many avec le modèle Recette.
        return $this->belongsToMany(Recette::class, 'recette_ingredients', 'ingredient_id', 'recette_id', 'nom')
            // Inclut le champ 'quantite' de la table de liaison dans les résultats de la requête.
            ->withPivot('quantite')
            // Inclut les horodatages de création et de mise à jour dans la table de liaison.
            ->withTimestamps();
    }
}
