import Home from "./pages/Home.svelte";
import Recette from "./pages/Recette.svelte";
import NotFound from "./pages/NotFound.svelte";

const routes =  {
  "/": Home,
  "/recette": Recette,
 
  "*": NotFound,
};

export default routes;
