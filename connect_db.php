<?php
// กำหนดค่าการเชื่อมต่อ MySQL
$servername = "localhost";
$username = "root";
$password = "";
$database = "kuyfew";

// เชื่อมต่อกับ MySQL database
$conn = new mysqli($servername, $username, $password, $database);

// ตรวจสอบการเชื่อมต่อ
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

?>