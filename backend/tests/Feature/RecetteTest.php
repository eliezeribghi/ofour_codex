<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\Recette;
use Illuminate\Foundation\Testing\RefreshDatabase;

class RecetteTest extends TestCase
{
    use RefreshDatabase;

    public function test_get_all_recettes()
    {
        Recette::factory()->count(5)->create();

        $response = $this->getJson('/api/recettes');

        $response->assertStatus(200)
                 ->assertJsonCount(5);
    }

    public function test_get_single_recette()
    {
        $recette = Recette::factory()->create();

        $response = $this->getJson('/api/recettes/' . $recette->id);

        $response->assertStatus(200)
                 ->assertJson([
                     'id' => $recette->id,
                 ]);
    }
}
