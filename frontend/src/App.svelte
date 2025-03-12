<script>
  import Router, { location } from "svelte-spa-router";
  import routes from "./routes";

  // Components
  import Header from "./components/Header.svelte";
  import Footer from "./components/Footer.svelte";

  // On vérifie la page sur laquelle on est pour appliquer
  // une classe sur notre body et changer notre background
  // au besoin

  // ! - À décommenter après installation de 'spa-svelte-router'
  // ! - et importation de { location } de 'svelte-spa-router'

  import { beforeUpdate } from "svelte";

  beforeUpdate(() => {
    $location === "/"
      ? document.body.classList.add("homepage")
      : document.body.classList.remove("homepage");
  });
</script>

<Header />
<Router {routes} />
<Footer />
