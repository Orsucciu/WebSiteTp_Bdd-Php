<?php
$dbh = new PDO('mysql:host=localhost;dbname=ecole', 'root', 'root');
//echo "$_POST['prenom']";
$query = ('INSERT INTO ecole (PrenomEleve, NomEleve, DateNaissance, Sexe, IdClasse) VALUES ("'.$_POST['prenom'].'", "'.$_POST['nom'].'", "'.$_POST['date'].'","'.$_POST['sex'].'", 1);');
echo $query;
$getUsers = $dbh->prepare($query);
$getUsers->execute();
?>
