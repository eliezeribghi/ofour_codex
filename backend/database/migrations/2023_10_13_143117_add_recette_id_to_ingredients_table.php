<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB; // Ajout de cette ligne

class AddRecetteIdToIngredientsTable extends Migration
{
    public function up()
    {
        if (Schema::hasTable('ingredients')) {
            if (!Schema::hasColumn('ingredients', 'recette_id')) {
                Schema::table('ingredients', function (Blueprint $table) {
                    $table->unsignedBigInteger('recette_id')->nullable();
                });
            }

            // Vérifier si la clé étrangère existe avant de l'ajouter
            $foreignKeyExists = DB::table('information_schema.TABLE_CONSTRAINTS')
                ->where('TABLE_NAME', 'ingredients')
                ->where('CONSTRAINT_NAME', 'ingredients_recette_id_foreign')
                ->exists();

            if (!$foreignKeyExists) {
                Schema::table('ingredients', function (Blueprint $table) {
                    $table->foreign('recette_id')->references('id')->on('recettes')->onDelete('cascade');
                });
            }
        }
    }

    public function down()
    {
        if (Schema::hasTable('ingredients') && Schema::hasColumn('ingredients', 'recette_id')) {
            Schema::table('ingredients', function (Blueprint $table) {
                $table->dropForeign(['recette_id']);
                $table->dropColumn('recette_id');
            });
        }
    }
}

