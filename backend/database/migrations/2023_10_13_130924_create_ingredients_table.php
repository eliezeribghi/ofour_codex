<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIngredientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Création de la table 'ingredients'
        if (!Schema::hasTable('ingredients')){
        Schema::create('ingredients', function (Blueprint $table) {
            $table->id(); // Colonne pour l'ID unique de l'ingrédient
            $table->string('nom'); // Colonne pour le nom de l'ingrédient
            $table->timestamps(); // Colonne pour les timestamps (created_at, updated_at)

           
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
        // Suppression de la table 'ingredients'
        Schema::dropIfExists('ingredients');
    }
}
