<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
   // Dans la migration create_categories_table.php
   public function up()
   {
       if (!Schema::hasTable('categories')) {
           Schema::create('categories', function (Blueprint $table) {
               $table->id();
               $table->string('nom');
               $table->timestamps();
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
        Schema::dropIfExists('categories');
    }
}
