<?php
include connection.php;

$query = ("SELECT * FROM classe;");

$number = 0;

foreach ($dbh->query($query) as $row) {
        $number++;
    }
    
echo json_encode(rand(0; $number));
//echo json_encode("42", JSON_HEX_TAG);
?>
