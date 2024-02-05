<?php
require("connect_db.php");
$sqlget = "SELECT * FROM subject_areas";
$result = $conn->query($sqlget);
while ($row = $result->fetch_assoc()) {
    $subject_areas[] = $row;
}
$sqlselect = "SELECT course.nameCourseUse as nameCourseUse  FROM subject_areas as sa INNER JOIN category as ca on sa.categoryId = ca.categoryId
INNER JOIN course on ca.courseId = course.courseId;";
$result = $conn->query($sqlselect);
$row = $result->fetch_assoc();
$coures = $row["nameCourseUse"];


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $subjectNameTh = $_POST["subjectNameTh"];
    $subjectNameEng = $_POST["subjectNameEng"];
    $subjectCredit = $_POST["subjectCredit"];
    $subjectAreasId = $_POST["subjectAreasId"];
    $sql = "INSERT INTO `subject`(`subjectId`, `subjectNameTh`, `subjectNameEng`, `subjectCredit`, `subjectAreasId`) 
    VALUES ('','$subjectNameTh','$subjectNameEng','$subjectCredit','$subjectAreasId')";
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
        <br><label>subjectNameTh<input type="text" name="subjectNameTh" /></label><br>
        <br><label>subjectNameEng<input type="text" name="subjectNameEng" /></label><br>
        <br><label>subjectCredit<input type="text" name="subjectCredit" /></label><br>
        <br><label>subjectAreasId</label><select name="subjectAreasId" id="subjectAreasId">
            <?php

            echo "<option selected disabled>กรุณาเลือกกลุ่มวิชา</option>";
            foreach ($subject_areas as $s) {
            ?>
                <option value="<?php echo $s["subjectAreasId"] ?>"><?php echo $s["subjectAreasNameTh"]."(".$coures.")" ?></option> ";
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