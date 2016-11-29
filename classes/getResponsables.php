<?php
//include connection.php;
$dbh = new PDO('mysql:host=localhost;dbname=ecole', 'root', 'root');

$retour ="";
$query = ('SELECT * FROM responsable');

$getResponsables = $dbh->prepare($query);
$getResponsables->execute();
$row = $getResponsables->fetchAll(PDO::FETCH_ASSOC);

$head = "<select>";

$body = "";
for($i = 0; $i < sizeof($row); $i++){
  $body .= "<option id='".$row[$i]['NumResponsable']."' value='".$row[$i]['NumResponsable']."'>".$row[$i]['PrenomResponsable']." ".$row[$i]['NomResponsable']."</option>";
}

$foot = "</select>";

echo $head.$body.$foot;
?>
