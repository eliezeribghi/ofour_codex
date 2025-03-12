<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEtapesPreparationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    // Dans la migration create_etapes_preparation_table.php
public function up()
{
     if (!Schema::hasTable('etapes_preparation')){
    Schema::create('etapes_preparation', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('recette_id');
        $table->integer('numero_etape');
        $table->text('description_etape');
        $table->timestamps();

        $table->foreign('recette_id')->references('id')->on('recettes');
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
        Schema::dropIfExists('etapes_preparation');
    }
}
