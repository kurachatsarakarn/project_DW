<?php
require("connect_db.php");
$sqlget = "SELECT * FROM `category`";
$result = $conn->query($sqlget);
while ($row = $result->fetch_assoc()) {
    $category[] = $row;
}
$sqlselect = "SELECT course.nameCourseUse as nameCourseUse  FROM subject_areas as sa INNER JOIN category as ca on sa.categoryId = ca.categoryId
INNER JOIN course on ca.courseId = course.courseId;";
$result = $conn->query($sqlselect);
$row = $result->fetch_assoc();
$coures = $row["nameCourseUse"];


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $subjectAreasNameTh = $_POST["subjectAreasNameTh"];
    $subjectAreasNameEng = $_POST["subjectAreasNameEng"];
    $categoryId = $_POST["categoryId"];
    $sql = "INSERT INTO `subject_areas`(`subjectAreasId`, `subjectAreasNameTh`, `subjectAreasNameEng`, `categoryId`) 
    VALUES ('','$subjectAreasNameTh','$subjectAreasNameEng','$categoryId')";
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
        <br><label>subjectAreasNameTh<input type="text" name="subjectAreasNameTh"/></label><br>
        <br><label>subjectAreasNameEng<input type="text" name="subjectAreasNameEng" /></label><br>
        <br><label>category</label><select name="categoryId" id="categoryId">
            <?php

            echo "<option selected disabled>กรุณาเลือกหมวด</option>";
            foreach ($category as $s) {
            ?>
                <option value="<?php echo $s["categoryId"] ?>"><?php echo $s["categoryNameTh"]."(".$coures.")"?></option> ";
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