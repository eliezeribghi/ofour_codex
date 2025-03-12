<?php

namespace Database\Factories;

use App\Models\Recette;
use App\Models\Categorie;
use Illuminate\Database\Eloquent\Factories\Factory;

class RecetteFactory extends Factory
{
    protected $model = Recette::class;

    public function definition()
    {
        return [
            'titre' => $this->faker->word,
            'contenu' => $this->faker->sentence,
            'temps_prep' => $this->faker->numberBetween(10, 60),
            'temps_cuis' => $this->faker->numberBetween(5, 90),
            'difficulte' => $this->faker->randomElement(['facile', 'moyen', 'difficile']),
            'image_url' => $this->faker->imageUrl(),
            'note_moyenne' => $this->faker->randomFloat(2, 1, 5),
            'categorie_id' => Categorie::factory(),  // Utiliser la factory de Categorie
        ];
    }
}
