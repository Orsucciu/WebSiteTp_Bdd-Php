<?php
$dbh = new PDO('mysql:host=localhost;dbname=ecole', 'root', 'root');
//echo "$_POST['prenom']";
$query = ('INSERT INTO eleve (PrenomEleve, NomEleve, DateNaissance, Sexe, IdClasse, NumResponsable) VALUES ("'.$_POST['prenom'].'", "'.$_POST['nom'].'", "'.$_POST['date'].'","'.$_POST['sex'].'", "'.$_POST['classe'].'", "'.$_POST['NumResponsable'].'");');
echo $query;
$getUsers = $dbh->prepare($query);
$getUsers->execute();
?>
