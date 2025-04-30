<?php

class Car
{
    // Propriété : modèle de la voiture
    public $model;

    // Méthode pour afficher le modèle
    public function displayModel()
    {
        echo "Le modèle de la voiture est : " . $this->model . PHP_EOL;
    }
}

// Exemple d'utilisation :
$myCar = new Car();
$myCar->model = "Toyota"; // On définit le modèle de la voiture
$myCar->displayModel();   // Affiche : Le modèle de la voiture est : Toyota




class Personne


{

    public $age;

    public  $nom;

    public function sePresenter()

    {
        return "Je m'appelle  $this->age  et j'ai  $this->nom ans." . PHP_EOL;
    }
}

$mepresenter = new Personne();
$mepresenter->age = "45";
$mepresenter->nom = "moi";

echo $mepresenter->sePresenter();



class voiture

{
    public $couleur;
    public $marque;

    public function uneJolieVoirture()
    {
        return "une belle voiture de la marque $this->marque avec la couleur $this->couleur est tres jolie" . PHP_EOL;
    }
}
$laVoiture = new Voiture();
$laVoiture->couleur = "vert";
$laVoiture->marque = "citroen";

echo $laVoiture->uneJolieVoirture();

/* Exercice :

Crée une classe Etudiant avec des propriétés privées nom et note, un constructeur pour les initialiser, et des getters pour les récupérer.
Ajoute une méthode afficherResultat qui retourne "L'étudiant [nom] a une note de [note]."
Teste avec un objet. */

class Etudiant

{
    private $nom;
    private $note;

    public function __construct($nom, $note)
    {
        $this->nom = $nom;
        $this->note = $note;
    }
    public function getNom()
    {
        $this->nom;
    }

    public function getNote()
    {

        $this->note;
    }
}


$unEtudiant = new Etudiant("Jean Dupont", 15);

// Affichage
echo "je m'appelle" . $unEtudiant->getNom() . " ma noté est" . $unEtudiant->getNote();
?>
