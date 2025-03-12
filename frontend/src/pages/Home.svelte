<script>
    import Edito from "../components/Edito.svelte";
    import Random from "../components/Random.svelte";
  
    import Cards from "../components/Cards.svelte";
   

    
</script>
<main>
  <section class="img_header">
      <div class="img_header__logo-background-image"></div> <!-- Utilisez le bon nom de classe -->
  </section>


  <Edito />
<hr>

 
<h1>Favoris de la Maison</h1>

<Cards /> 

   <Random />

<h1>Nouvelles Créations Culinaires</h1>
<Cards /> 



  </main>

