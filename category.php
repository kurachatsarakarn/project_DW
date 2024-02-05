<?php
require("connect_db.php");
$sqlget = "SELECT * FROM course";
$result = $conn->query($sqlget);
while ($row = $result->fetch_assoc()) {
    $coures[] = $row;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $categoryNameTh = $_POST["categoryNameTh"];
    $categoryNameEng = $_POST["categoryNameEng"];
    $courseId = $_POST["coures"];
    $sql = "INSERT INTO `category`(`categoryId`, `categoryNameTh`, `categoryNameEng`, `courseId`) 
    VALUES ('','$categoryNameTh','$categoryNameEng','$courseId')";
    if ($conn->query($sql) === FALSE) {
        echo "Error: " . $conn->error . "<br>";
    }
}


?>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <form method="post" action="">
        <br><label>categoryNameTh<input type="text" name="categoryNameTh"/></label><br>
        <br><label>categoryNameEng<input type="text" name="categoryNameEng" /></label><br>
        <br><label>nameCourseUse</label><select name="coures" id="coures">
            <?php

            echo "<option selected disabled>กรุณาหลักสูตร</option>";
            foreach ($coures as $s) {
            ?>
                <option value="<?php echo $s["courseId"] ?>"><?php echo $s["nameCourseUse"] ?></option> ";
            <?php
            }
            ?>
        </select><br>
        <button type="submit" name="submit" value="save">save</button>
    </form>
    <form action="index.php">
        <button type="submit" name="submit" value="index.php">back</button>
    </form>
</body>

</html>