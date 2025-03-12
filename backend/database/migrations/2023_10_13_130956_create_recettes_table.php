<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRecettesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        if (!Schema::hasTable('recettes')){
        // Création de la table 'recettes'
        Schema::create('recettes', function (Blueprint $table) {
            $table->id(); // Colonne pour l'ID unique
            $table->string('titre'); // Colonne pour le titre de la recette
            $table->text('contenu'); // Colonne pour le contenu ou les instructions de la recette
            $table->unsignedBigInteger('categorie_id'); // Colonne pour la clé étrangère de la catégorie
            $table->integer('temps_prep'); // Colonne pour le temps de préparation (en minutes)
            $table->integer('temps_cuis'); // Colonne pour le temps de cuisson (en minutes)
            $table->string('difficulte'); // Colonne pour la difficulté (facile, moyen, difficile)
            $table->string('image_url'); // Colonne pour l'URL de l'image de la recette
            $table->decimal('note_moyenne', 3, 2)->nullable(); // Colonne pour la note moyenne, nullable
            $table->timestamps(); // Colonne pour les timestamps (created_at, updated_at)

            // Déclaration de la clé étrangère
            $table->foreign('categorie_id')->references('id')->on('categories');
        });
    }
    }
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // Suppression de la table 'recettes'
        Schema::dropIfExists('recettes');
    }
}
