<?php
$dbh = new PDO('mysql:host=localhost;dbname=ecole', 'root', 'root');
$query = ('DELETE FROM `ecole`.`eleve` WHERE `eleve`.`NumEleve` = '.$_POST['id'].' ');
$getUsers = $dbh->prepare($query);
$getUsers->execute();
?>
