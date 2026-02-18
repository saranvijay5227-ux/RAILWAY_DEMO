<?php
include 'db.php';

$passenger_id = $_POST['passenger_id'];
$name = $_POST['name'];
$age = $_POST['age'];

$sql = "INSERT INTO passengers (passenger_id, name, age)
        VALUES ('$passenger_id', '$name', '$age')";

if (mysqli_query($conn, $sql)) {
    echo "Passenger Added Successfully";
} else {
    echo "Error: " . mysqli_error($conn);
}
?>
