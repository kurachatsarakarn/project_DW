<?php
require("connect_db.php");
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $department = $_POST["departmentId"];
    $nameCourseTh = $_POST["nameCourseTh"];
    $nameCourseUse = $_POST["nameCourseUse"];
    $planCourse = $_POST["planCourse"];
    $nameCourseEng = $_POST["nameCourseEng"];
    $nameFullDegreeTh = $_POST["nameFullDegreeTh"];
    $nameFullDegreeEng = $_POST["nameFullDegreeEng"];
    $nameInitialsDegreeTh = $_POST["nameInitialsDegreeTh"];
    $nameInitialsDegreeEng = $_POST["nameInitialsDegreeEng"];
    $courseStartYear = $_POST["courseStartYear"];
    $courseEndYear = $_POST["courseEndYear"];
    $totalCredit = $_POST["totalCredit"];
    $GeneralSubjectCredit = $_POST["GeneralSubjectCredit"];
    $specificSubjectCredit = $_POST["specificSubjectCredit"];
    $freeSubjectCredit = $_POST["freeSubjectCredit"];
    $coreSubjectCredit = $_POST["coreSubjectCredit"];
    $spacialSubjectCredit = $_POST["spacialSubjectCredit"];
    $selectSubjectCredit = $_POST["selectSubjectCredit"];
    $happySubjectCredit = $_POST["happySubjectCredit"];
    $entrepreneurshipSubjectCredit = $_POST["entrepreneurshipSubjectCredit"];
    $languageSubjectCredit = $_POST["languageSubjectCredit"];
    $peopleSubjectCredit = $_POST["peopleSubjectCredit"];
    $aestheticsSubjectCredit = $_POST["aestheticsSubjectCredit"];
    $internshipHours = $_POST["internshipHours"];
    $sql = "INSERT INTO `course`(`courseId`, `departmentId`, `nameCourseTh`, `nameCourseUse`, 
        `planCourse`, `nameCourseEng`, `nameFullDegreeTh`, `nameFullDegreeEng`, 
        `nameInitialsDegreeTh`, `nameInitialsDegreeEng`, `courseStartYear`, `courseEndYear`, 
        `totalCredit`, `GeneralSubjectCredit`, `specificSubjectCredit`, `freeSubjectCredit`, 
        `coreSubjectCredit`, `spacialSubjectCredit`, `selectSubjectCredit`, `happySubjectCredit`, 
        `entrepreneurshipSubjectCredit`, `languageSubjectCredit`, `peopleSubjectCredit`, 
        `aestheticsSubjectCredit`, `internshipHours`) 
        VALUES ('','$department','$nameCourseTh','$nameCourseUse','$planCourse','$nameCourseEng',
        '$nameFullDegreeTh','$nameFullDegreeEng','$nameInitialsDegreeTh','$nameInitialsDegreeEng',
        '$courseStartYear','$courseEndYear','$totalCredit',
        '$GeneralSubjectCredit','$specificSubjectCredit','$freeSubjectCredit','$coreSubjectCredit',
        '$spacialSubjectCredit','$selectSubjectCredit','$happySubjectCredit',
        '$entrepreneurshipSubjectCredit','$languageSubjectCredit','$peopleSubjectCredit',
        '$aestheticsSubjectCredit','$internshipHours')";
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
        <br><label>department<input type="text" name="departmentId" id="departmentId" /></label><br>
        <br><label>nameCourseTh<input type="text" name="nameCourseTh" /></label><br>
        <br><label>nameCourseUse <input type="text" name="nameCourseUse" /></label><br>
        <br><label>planCourse<input type="text" name="planCourse" /></label><br>
        <br><label>nameCourseEng<input type="text" name="nameCourseEng" /></label><br>
        <br><label>nameFullDegreeTh<input type="text" name="nameFullDegreeTh" /></label><br>
        <br><label>nameFullDegreeEng<input type="text" name="nameFullDegreeEng" /></label><br>
        <br><label>nameInitialsDegreeTh<input type="text" name="nameInitialsDegreeTh" /></label><br>
        <br><label>nameInitialsDegreeEng<input type="text" name="nameInitialsDegreeEng" /></label><br>
        <br><label>courseStartYear<input type="date" name="courseStartYear" value="date" /></label><br>
        <br><label>courseEndYear<input type="date" name="courseEndYear" value="date" /></label><br>
        <br><label>totalCredit<input type="text" name="totalCredit" /></label><br>
        <br><label>GeneralSubjectCredit<input type="text" name="GeneralSubjectCredit" /></label><br>
        <br><label>specificSubjectCredit<input type="text" name="specificSubjectCredit" /></label><br>
        <br><label>freeSubjectCredit<input type="text" name="freeSubjectCredit" /></label><br>
        <br><label>coreSubjectCredit<input type="text" name="coreSubjectCredit" /></label><br>
        <br><label>spacialSubjectCredit<input type="text" name="spacialSubjectCredit" /></label><br>
        <br><label>selectSubjectCredit<input type="text" name="selectSubjectCredit" /></label><br>
        <br><label>happySubjectCredit<input type="text" name="happySubjectCredit" /></label><br>
        <br><label>entrepreneurshipSubjectCredit<input type="text" name="entrepreneurshipSubjectCredit" /></label><br>
        <br><label>languageSubjectCredit<input type="text" name="languageSubjectCredit" /></label><br>
        <br><label>peopleSubjectCredit<input type="text" name="peopleSubjectCredit" /></label><br>
        <br><label>aestheticsSubjectCredit<input type="text" name="aestheticsSubjectCredit" /></label><br>
        <br><label>internshipHours<input type="text" name="internshipHours" /></label><br>
        <button type="submit" name="submit" value="save">save</button>
    </form>
    <form action="index.php">
        <button type="submit" name="submit" value="index.php">back</button>
    </form>
</body>

</html>