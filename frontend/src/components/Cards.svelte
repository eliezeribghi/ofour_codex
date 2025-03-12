<script>
  import Modal from "./Modal.svelte";

  let recettes = [];
  let selectedRecette = null; // Variable pour stocker la recette sélectionnée
  let showModal = false;
  let scrollY = 0; // Pour sauvegarder la position du scroll

  // Fonction pour ouvrir la modale et sauvegarder la position du scroll
  function openModal() {
    scrollY = window.scrollY;
    showModal = true;
  }

  // Lors de la fermeture de la modale, restaurer la position du scroll
  function closeModal() {
    showModal = false;
    window.scrollTo(0, scrollY);
  }

  // Fonction pour obtenir les données de l'API
  async function getCardData() {
    try {
      const response = await fetch(`http://localhost:8000/api/recettes/`);
      if (response.ok) {
        recettes = await response.json();
        console.log("test", recettes);
      } else {
        console.error(
          "Erreur lors de la récupération des données des recettes",
        );
      }
    } catch (error) {
      console.error("Une erreur s'est produite:", error);
    }
  }

  getCardData();

  // Fonction pour obtenir les détails d'une recette spécifique
  async function getRecetteDetails(id) {
    try {
      const response = await fetch(`http://localhost:8000/api/recettes/${id}`);

      if (response.ok) {
        selectedRecette = await response.json(); // Stocke les détails de la recette
        console.log("id", selectedRecette);

        openModal(); // Ouvre la modale après avoir récupéré les détails
      } else {
        console.error(
          "Erreur lors de la récupération des détails de la recette",
        );
      }
    } catch (error) {
      console.error("Une erreur s'est produite:", error);
    }
  }
</script>

<div class="theme-cards-container">
  {#each recettes.splice(0, 4) as recette (recette.id)}
    <article
      class="theme-card"
      style="background: url({recette.image_url}) center/cover no-repeat"
    >
      <div class="theme-card__informations">
        <ul class="theme-card__infos-list">
          <li class="theme-card__infos-elt">
            <img src="../public/icons/icons8-horloge-50.png" alt="Temps" />
            <span>{recette.temps_cuisson} minutes</span>
          </li>
          <li class="theme-card__infos-elt">
            <img src="../public/icons/icons8-marmite-64.png" alt="Capacité" />
            <span>{recette.contenu}</span>
          </li>
          <li class="theme-card__infos-elt">
            <img src="../public/icons/icons8-dificulty-64.png" alt="Difficulté" />
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
    <article class="modal-recette">
      <h2 class="modal-title">{selectedRecette.titre}</h2>
      <img
        class="modal-image"
        src={selectedRecette.image_url}
        alt={selectedRecette.titre}
      />
      <p class="modal-contenu">{selectedRecette.contenu}</p>
      <ul>
        <li>Temps de cuisson : {selectedRecette.temps_cuisson} minutes</li>
        <li>Preparation : {selectedRecette.temps_preparation}</li>
        <li>Difficulté : {selectedRecette.niveau_difficulte}</li>
        <li>Catégorie : {selectedRecette.categorie.nom}</li>
        <li>
          Capacité : <!-- Ajouter le bon champ pour la capacité ici si nécessaire -->
        </li>
        <li>
         <h3>   Ingrédients ; </h3>
          <ul>
            {#each selectedRecette.recette_ingredients as recette_ingredient}
              <li>
                {recette_ingredient.ingredient.nom} : {recette_ingredient.quantite}
              </li>
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
