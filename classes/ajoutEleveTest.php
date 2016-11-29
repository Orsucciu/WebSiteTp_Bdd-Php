<?php
$dbh = new PDO('mysql:host=localhost;dbname=ecole', 'root', 'root');
//echo "$_POST['prenom']";
$query = ('INSERT INTO eleve (PrenomEleve, NomEleve, DateNaissance, Sexe, IdClasse, NumResponsable) VALUES ("Azazaz", "QSSqSQS", "1900-10-10","Masculin", 1, 2);');
echo $query;
$getUsers = $dbh->prepare($query);
$getUsers->execute();
?>
