<script lang="ts">
  import { link } from "svelte-spa-router";

  // Fonction pour afficher le menu en mobile
  function displayMenu() {
    const navMenu = document.querySelector(".nav-menu") as HTMLElement;
    navMenu.style.display = "flex";
    navMenu.style.left = "0";
  }

  // Masquer le menu en mobile
  function hideMenu() {
    const navMenu = document.querySelector(".nav-menu") as HTMLElement;
    navMenu.style.display = "none";
  }
</script>

<header>
  <a
    href="/"
    class="home-link-logo"
    aria-label="Aller à la page d'accueil"
    use:link
  ></a>

  <!-- Le bouton n'est visible qu'au format mobile & tablette -->
  <button
    type="button"
    id="menubutton"
    class="menu-button"
    aria-label="Accès menu"
    aria-haspopup="true"
    aria-expanded="false"
    aria-controls="main-menu"
    on:click={displayMenu}
  >
    Menu
  </button>

  <!-- La navigation n'est visible qu'au format desktop -->
  <nav class="nav-menu" aria-label="header navigation">
    <button
      type="button"
      id="closebutton"
      class="menu-button menu-button--close"
      aria-label="Fermer menu"
      aria-haspopup="true"
      aria-expanded="false"
      aria-controls="close-menu"
      on:click={hideMenu}
    >
      Fermer
    </button>

    <!-- Notre liste comprenant notre menu -->
    <ul id="main-menu" role="menu" aria-labelledby="menubutton">
      <li role="menuitem">
        <a
          href="/"
          class="nav-menu__link"
          aria-label="Page d'accueil du site"
          on:click={hideMenu}
          use:link
        >
          Accueil
        </a>
      </li>
      <li role="menuitem">
        <a
          href="/recette"
          class="nav-menu__link"
          aria-label="Découvrez nos recettes"
          on:click={hideMenu}
          use:link
        >
          Recette
        </a>
      </li>
    </ul>
    <img
      class="menu-logo"
      src="/header-logo.png"
      alt="Logo entreprise"
    />
  </nav>
</header>
