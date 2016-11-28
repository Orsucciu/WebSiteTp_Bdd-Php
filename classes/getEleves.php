<?php
//include connection.php;
$dbh = new PDO('mysql:host=localhost;dbname=ecole', 'root', 'root');

$retour ="";
$query = ('SELECT * FROM eleve');

$getUsers = $dbh->prepare($query);
$getUsers->execute();
$row = $getUsers->fetchAll(PDO::FETCH_ASSOC);

$head = "<table style='border: 1px solid black'><tr><th>Nom de L'élève</th><th>Prénom de l'élève</th></tr><th></th><th></th>";
$body ="";
for($i = 0; $i < sizeof($row); $i++){
    $body .= "<tr><td>".$row[$i]['NomEleve']."</td><td>".$row[$i]['PrenomEleve']."</td><td id=".$row[$i]['NumEleve']."><button onclick='supprimerEleve();'>SUPPRIMER</button></td><td id=".$row[$i]['NumEleve']."><button onclick='editerEleve();'>EDITER</button></td></tr>";
}
$foot = "</table><button onclick='addEleve();'>Ajouter un élève</button>";

echo $head.$body.$foot;
?>
