<script>
  import Modal from "../components/Modal.svelte";
  import { onMount } from "svelte";
  
  let recettes = [];
  let searchQuery = "";
  let selectedRecette = null;
  let showModal = false;
  let scrollY = 0;
  let recetteType = "all"; // Par défaut, afficher toutes les recettes

  // Récupérer toutes les recettes
  async function getAllRecettes() {
    try {
      const response = await fetch(`http://localhost:8000/api/recettes`);
      if (response.ok) {
        recettes = await response.json();
      } else {
        console.error("Erreur lors de la récupération des recettes");
      }
    } catch (error) {
      console.error("Une erreur s'est produite:", error);
    }
  }

  // Filtrer les recettes selon la recherche et le type sélectionné
  $: filteredRecettes = recettes.filter((recette) => {
  const matchesSearch = recette.titre
    .toLowerCase()
    .includes(searchQuery.toLowerCase());

  const matchesType = recetteType === "all" || (recette.categorie && recette.categorie.nom === recetteType);
  
  console.log('Recette:', recette);
  console.log('matchesType:', matchesType);

  return matchesSearch && matchesType;
});


  onMount(getAllRecettes);

  // Ouvrir la modal pour une recette spécifique
  function openModal() {
    scrollY = window.scrollY;
    showModal = true;
  }

  // Fermer la modal
  function closeModal() {
    showModal = false;
    window.scrollTo(0, scrollY);
  }

  // Récupérer les détails d'une recette
  async function getRecetteDetails(id) {
    try {
      const response = await fetch(`http://localhost:8000/api/recettes/${id}`);
      if (response.ok) {
        selectedRecette = await response.json();
        openModal();
      } else {
        console.error("Erreur lors de la récupération des détails de la recette");
      }
    } catch (error) {
      console.error("Une erreur s'est produite:", error);
    }
  }
</script>

<!-- Barre de recherche -->
<input
class="input-seach"
  type="text"
  placeholder="Rechercher une recette..."
  bind:value={searchQuery}
/>


<!-- Radio buttons pour choisir le type de recette -->
<section class="section-select-radio">
  <h2 >Catégorie sélectionnée  :</h2>
  <span class="">
  <div>
    <input id="all" type="radio" bind:group={recetteType} value="all" />
    <label for="all">Toutes</label>
  </div>
  <div>
    <input id="dessert" type="radio" bind:group={recetteType} value="Desserts" />
    <label for="dessert">Desserts</label>
  </div>
  <div>
    <input id="plat" type="radio" bind:group={recetteType} value="Plats principaux" />
    <label for="plat">Plats principaux</label>
  </div>
</span>
</section>


<!-- Radio buttons avec liaison -->


<!-- Afficher les recettes filtrées -->
<div class="theme-cards-container">
  {#each filteredRecettes as recette (recette.id)}
    <article
      class="theme-card"
      style="background: url({recette.image_url}) center/cover no-repeat"
    >
      <div class="theme-card__informations">
        <ul class="theme-card__infos-list">
          <li class="theme-card__infos-elt">
            <img src="../public/icons/icons8-horloge-50.png" alt="Temps" />
           <span> {recette.temps_cuisson} minutes </span >
          </li>
          <li class="theme-card__infos-elt">
            <img src="../public/icons/icons8-marmite-64.png" alt="Capacité" />
            <span>{recette.contenu}</span>
          </li>
          <li class="theme-card__infos-elt">
            <img
              src="../public/icons/icons8-dificulty-64.png"
              alt="difficulte"
            />
            <span>{recette.niveau_difficulte}</span>
          </li>
        </ul>
      </div>
      <button
        on:click={() => getRecetteDetails(recette.id)}
        class="theme-card__button"
      >
        {recette.titre}
      </button>
    </article>
  {/each}
</div>

<!-- Modale avec le contenu de la recette sélectionnée -->
<Modal bind:showModal on:close={closeModal}>
  {#if selectedRecette}
    <article class="modal_recette">
      <h2>{selectedRecette.titre}</h2>
      <img
        class="modal-image"
        src={selectedRecette.image_url}
        alt={selectedRecette.titre}
      />
      <p>{selectedRecette.contenu}</p>
      <ul>
        <li>Temps de cuisson : {selectedRecette.temps_cuisson} minutes</li>
        <li>Préparation : {selectedRecette.temps_preparation}</li>
        <li>Difficulté : {selectedRecette.niveau_difficulte}</li>
        <li>Catégorie : {selectedRecette.categorie.nom}</li>
        <li>
          Ingrédients ;
          <ul>
            {#each selectedRecette.recette_ingredients as recette_ingredient}
              <li>{recette_ingredient.ingredient.nom}  : {recette_ingredient.quantite}</li>
            {/each}
          </ul>
            <!-- Affichage des étapes de préparation -->
      {#if selectedRecette.etapes_preparation}
      <h3>Étapes de préparation :</h3>
      <ol>
        {#each selectedRecette.etapes_preparation as etape, index}
          <li>Étape {index + 1}: {etape.description_etape}</li>
        {/each}
      </ol>
    {/if}
  
        </li>
      </ul>
    </article>
  {/if}
</Modal>

<style>


</style>
