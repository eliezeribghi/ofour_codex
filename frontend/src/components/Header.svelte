<script lang="ts">
  import { link } from "svelte-spa-router";
  export { link };

  // Exemple de tableau pour le menu
  const menuItems = [
    { href: "/", label: "Accueil", aria: "Page d'accueil du site" },
    { href: "/recette", label: "Recette", aria: "Découvrez nos recettes" }
  ];

  // Fonction pour afficher le menu en mobile
  function displayMenu() {
    const navMenu = document.querySelector(".nav-menu") as HTMLElement | null;
    if (navMenu) {
      navMenu.style.display = "flex";
      navMenu.style.left = "0";
    }
  }

  // Masquer le menu en mobile
  function hideMenu() {
    const navMenu = document.querySelector(".nav-menu") as HTMLElement | null;
    if (navMenu) {
      navMenu.style.display = "none";
    }
  }
</script>

<header>
  <a
    href="/"
    class="home-link-logo"
    aria-label="Aller à la page d'accueil"
    use:link
  >
    <img src="/header-logo.png" alt="Accueil" />
  </a>

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

    <!-- Bloc each CORRIGÉ -->
    <ul id="main-menu" role="menu" aria-labelledby="menubutton">
      {#each menuItems as item, index (item.href)}

        <li role="menuitem">
          <a
            href={item.href}
            class="nav-menu__link"
            aria-label={item.aria}
            on:click={hideMenu}
            use:link
          >
            {item.label}
          </a>
        </li>
      {/each}
    </ul>
    <img
      class="menu-logo"
      src="/header-logo.png"
      alt="Logo entreprise"
    />
  </nav>
</header>
