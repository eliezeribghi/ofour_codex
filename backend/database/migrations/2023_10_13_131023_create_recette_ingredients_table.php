<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRecetteIngredientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        if (!Schema::hasTable('recette_ingredients')){
        // Création de la table 'recette_ingredients'
        Schema::create('recette_ingredients', function (Blueprint $table) {
            $table->id(); // Colonne pour l'ID unique de la relation recette-ingredient
            $table->unsignedBigInteger('recette_id'); // Colonne pour l'ID de la recette
            $table->unsignedBigInteger('ingredient_id'); // Colonne pour l'ID de l'ingrédient
            $table->integer('quantite'); // Colonne pour la quantité de l'ingrédient
            $table->timestamps(); // Colonne pour les timestamps (created_at, updated_at)

            // Déclaration des clés étrangères
            $table->foreign('recette_id')->references('id')->on('recettes')->onDelete('cascade');
            $table->foreign('ingredient_id')->references('id')->on('ingredients')->onDelete('cascade');
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
        // Suppression de la table 'recette_ingredients'
        Schema::dropIfExists('recette_ingredients');
    }
}
