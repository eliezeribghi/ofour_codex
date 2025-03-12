<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EtapePreparation extends Model
{
    // Nom de la table dans la base de données associée à ce modèle
    protected $table = 'etapes_preparation';

    // Relation avec le modèle Recette : une étape de préparation appartient à une recette
    public function recette()
    {
        return $this->belongsTo(Recette::class, 'recette_id');
    }


    
}
