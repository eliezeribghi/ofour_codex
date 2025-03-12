<?php

namespace App\Http\Controllers;

use App\Models\Recette;
use App\Models\Ingredient;
use App\Models\EtapePreparation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Google\Cloud\Storage\StorageClient;
use Illuminate\Support\Str;

use Illuminate\Support\Facades\DB;

class RecetteController extends Controller
{
    
    /**
     * Affiche la liste des recettes.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function list()
    {
        try {
            // Récupérer toutes les recettes avec leurs ingrédients associés et les images
            $recettes = Recette::with(relations: ['categorie', 'ingredients', 'etapesPreparation', 'recetteIngredients.ingredient'])
                ->get()
                ->map(function ($recette) {
                    // Vérification et formatage correct de l'image
                    $recette->image_url = $recette->image_url ? asset('./images/' . basename($recette->image_url)) : null;
                    return $recette;
                });

            return response()->json($recettes);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erreur lors de la récupération des recettes.', 'details' => $e->getMessage()], 500);
        }
    }

    /**
     * Affiche les détails d'une recette spécifique.
     *
     * @param  int  $id  L'identifiant de la recette à afficher.
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        try {
            $recette = Recette::with(['etapesPreparation', 'recetteIngredients.ingredient', 'categorie'])
                ->findOrFail($id);

            // Vérification et formatage correct de l'image
            $recette->image_url = $recette->image_url ? asset('./images/' . basename($recette->image_url)) : null;

            return response()->json($recette);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erreur lors de la récupération des détails de la recette.', 'details' => $e->getMessage()], 500);
        }
    }

    /**
     * Stocke une nouvelle recette.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */


    public function store(Request $request)
    {

        $validatedData = $request->validate([
            'titre' => 'required|string|min:3|max:255', //  Min 3 caractères, Max 255
            'contenu' => 'required|string|min:10', //  Minimum 10 caractères pour éviter du contenu trop court
            'categorie_id' => 'required|integer|exists:categories,id', //  Vérifie si la catégorie existe
            'temps_preparation' => 'required|integer|min:1|max:600', //  Entre 1 et 600 minutes
            'temps_cuisson' => 'required|integer|min:0|max:600', //  Cuisson peut être 0 (ex: salade)
            'niveau_difficulte' => 'required|string|in:Facile,Moyen,Difficile', // Niveau de difficulté contrôlé
            'image' => 'required|file|mimes:jpg,jpeg,png|max:2048', //  Image max 2 Mo
            'note_moyenne' => 'nullable|numeric|min:0|max:5', //  Note entre 0 et 5

            //  Validation des ingrédients
            'ingredients' => 'required|array|min:1', //  Au moins un ingrédient
            #'ingredients.*.ingredient_id' => 'required|integer|exists:ingredients,id', // Vérifie si l'ingrédient existe
            'ingredients.*.quantite' => 'required|string|min:1|max:50', //  Max 50 caractères

            //  Validation des étapes de préparation
            'etapes_preparation' => 'required|array|min:1', //  Au moins une étape
            'etapes_preparation.*.ordre' => 'required|integer|min:1', //  L'ordre doit être positif
            'etapes_preparation.*.description' => 'required|string|min:5|max:500', //  Description entre 5 et 500 caractères
        ]);




        //  1. Initialiser Google Cloud Storage
        $storage = new StorageClient([
            'keyFilePath' => storage_path('app/ofour-452518-5f81cd2295eb'), // Chemin vers la clé JSON
        ]);
        $bucketName = 'bucket_oufour'; // Remplace par le nom de ton bucket
        $bucket = $storage->bucket($bucketName);

        //  2. Récupérer le fichier et générer un nom unique
        $file = $request->file('image');
        $fileName = 'uploads/' . Str::random(20) . '.' . $file->getClientOriginalExtension(); // Nom unique

        //  3. Uploader sur GCS
        $bucket->upload(
            fopen($file->getRealPath(), 'r'),
            ['name' => $fileName]
        );

        //  4. Générer l'URL publique du fichier
        $imageUrl = "https://storage.googleapis.com/{$bucketName}/{$fileName}";

        //  5. Enregistrer la recette avec l'URL de l'image
        $recette = Recette::create([
            'titre' => $validatedData['titre'],
            'contenu' => $validatedData['contenu'],
            'categorie_id' => $validatedData['categorie_id'],
            'temps_preparation' => $validatedData['temps_preparation'],
            'temps_cuisson' => $validatedData['temps_cuisson'],
            'niveau_difficulte' => $validatedData['niveau_difficulte'],
            'image_url' => $imageUrl, // Stocke l'URL générée dans la BD
            'note_moyenne' => $validatedData['note_moyenne'] ?? null,
        ]);

        return response()->json([
            'message' => 'Recette créée avec succès',
            'recette' => $recette
        ]);


    }

}
