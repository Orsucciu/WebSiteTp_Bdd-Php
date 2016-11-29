<?php
//include connection.php;
$dbh = new PDO('mysql:host=localhost;dbname=ecole', 'root', 'root');

$retour ="";
$query = ('SELECT * FROM classe');

$getClasses = $dbh->prepare($query);
$getClasses->execute();
$row = $getClasses->fetchAll(PDO::FETCH_ASSOC);

$head = "<select>";

$body = "";
for($i = 0; $i < sizeof($row); $i++){
  $body .= "<option id='".$row[$i]['IdClasse']."' value='".$row[$i]['IdClasse']."'>".$row[$i]['Libelle']."</option>";
}

$foot = "</select>";

echo $head.$body.$foot;
?>
