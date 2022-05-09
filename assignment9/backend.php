<?php
header('Access-Control-Allow-Origin', '*');
header("Content-type: application.json; charset=UTF-8");

$servername = "127.0.0.1";
$username = "root";
$password = "";
$dbname = "wt_assign_7"; //We're using the same database from assignment 07
$port=3306;

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname,$port);

//query
$result = $conn->query("select * from student");

$outp = "";

while($rs = $result->fetch_array(MYSQLI_ASSOC)){

    if($outp != "") {$outp .= ",";}
    $outp .= '{"FNAME" : "' .$rs["fname"] . '",';
    $outp .= '"LNAME" : "' .$rs["lname"] . '",';
    $outp .= '"RNUM" : "' .$rs["rnum"] . '",';
    $outp .= '"EMAIL" : "' .$rs["email"] . '"}';
}


$outp = '{"records" : ['.$outp.']}';
$conn->close();

echo($outp);
?>