<script>
  import { onMount } from "svelte";

  export let recettes = [];

  let recetteAleatoire = null;

  // Fonction pour obtenir les données de l'API
  async function getCardData() {
    try {
      const response = await fetch(`http://localhost:8000/api/recettes/`);

    if (response.ok) {
  recettes = await response.json();
  console.log("Données reçues de l'API : ", recettes);

        // Sélectionner une recette aléatoire
        recetteAleatoire =
          recettes[Math.floor(Math.random() * recettes.length)];
      } else {
        console.error("Erreur lors de la récupération des données de l'équipe");
      }
    } catch (error) {
      console.error("Une erreur s'est produite:", error);
    }
  }

  // Appeler la fonction pour obtenir les données de l'API lorsque le composant est monté
  onMount(() => {
    getCardData();
  });
</script>
{#if recetteAleatoire}
  <section class="random-recipe">
    <h1>{recetteAleatoire.titre}</h1>
   

    <h3>{recetteAleatoire.contenu}</h3>
 <img 
      class="random-recipe-img-header"
      src={recetteAleatoire.image_url}
      alt={recetteAleatoire.titre}
    />

    <div class="recipe-random-description">
      <h3>{recetteAleatoire.niveau_difficulte}</h3>
    </div>
    
    <section class="recipe-random-ingredient">
      <ul>
        <li>
          <img
            class="recip-random-timer"
            src="../public/icons/icons8-horloge-50.png"
            alt="Temps"
          />
          Préparation : {recetteAleatoire.temps_preparation}
        </li>
        <li>
          <img
            class="recip-random-timer"
            src="../public/icons/icons8-horloge-50.png"
            alt="Temps"
          />
          Cuisson : {recetteAleatoire.temps_cuisson}
        </li>
      </ul>

      <h2>Ingrédients</h2>
      <ul>
        {#each recetteAleatoire.ingredients as ingredient}
          <li>{ingredient.nom} : {ingredient.pivot.quantite}</li>
        {/each}
      </ul>

      {#if recetteAleatoire.etapes_preparation && recetteAleatoire.etapes_preparation.length > 0}
      <h3>Étapes de préparation :</h3>
      <ol>
        {#each recetteAleatoire.etapes_preparation as etape, index}
          <li>Étape {index + 1}: {etape.description_etape}</li>
        {/each}
      </ol>
    {/if}
    
  
    </section>
  </section>
{:else}
  <p>Aucune recette disponible.</p>
{/if}
