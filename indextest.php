<?php
require("connect_db.php");
if (isset($_POST["subSubject"])) {
    $fileTmpPath = $_FILES["csvSubject"]["tmp_name"];

    // เปิดไฟล์ CSV
    $file = fopen($fileTmpPath, "r");
    //อ่านแถวแรก
    fgetcsv($file);

    // อ่านข้อมูลทีละบรรทัด
    while (($data = fgetcsv($file)) !== FALSE) {
        $subjectNameID = $data[0];
        $subjectNameTh = $data[1];
        $subjectNameEng = $data[2];
        $subjectCredit = $data[3];
        $subjectAreasNameTh = $data[4];
        $category = $data[5];
        $coures = $data[6];
        //echo $coures;

    
        $sqlcoures = "SELECT * FROM `course` WHERE course.nameCourseUse = '$coures' ";
        $result_couresID = $conn->query($sqlcoures);
        $row = $result_couresID->fetch_assoc();
        $couresID = $row['courseId'];
        
        $sqlcategory = "SELECT c.categoryId as ID FROM category as c 
            WHERE c.categoryNameTh = '$category' and c.courseId = '$couresID'";
        $chek1 = $conn->query($sqlcategory);
        $row1 = $chek1->fetch_assoc();
        if ($row1 == null){
            $sql_insert_category = "INSERT INTO `category`(`categoryId`, `categoryNameTh`, `courseId`) 
                VALUES ('','$category','$couresID')";
            $conn->query($sql_insert_category);
        }
        $sqlcategoryv_2 = "SELECT * FROM `category` WHERE categoryNameTh ='$category'";
        $result_couresID = $conn->query($sqlcategoryv_2);
        $row = $result_couresID->fetch_assoc();
        $categoryID = $row['categoryId'];

        $sqlsubjectAreas = "SELECT * FROM `subject_areas` as s 
        WHERE s.subjectAreasNameTh = '$subjectAreasNameTh' and s.categoryId = '$categoryID'";
        $chek2 = $conn->query($sqlsubjectAreas);
        $row2 = $chek2->fetch_assoc();
        if ($row2 == null){
            $sql_insert_susubjectAreas = "INSERT INTO `subject_areas`(`subjectAreasId`, `subjectAreasNameTh`, `categoryId`)
            VALUES ('','$subjectAreasNameTh','$categoryID')";
            $conn->query($sql_insert_susubjectAreas);
        }
        $sqlsubjectAreasId = "SELECT * FROM `subject_areas` as s WHERE  s.subjectAreasNameTh = '$subjectAreasNameTh'";
        $result_couresID = $conn->query($sqlsubjectAreasId);
        $row = $result_couresID->fetch_assoc();
        $subjectAreasId  = $row['subjectAreasId'];


        // เตรียม SQL statement
        $sql = "INSERT INTO subject (subjectId,subjectNameTh,
                                            subjectNameEng,
                                            subjectCredit,
                                            subjectAreasId  ) 
            VALUES ('$subjectNameID','$subjectNameTh', '$subjectNameEng','$subjectCredit','$subjectAreasId')";
        //echo $subjectAreasId;
        // ดำเนินการ SQL statement
        if ($conn->query($sql) === FALSE) {
         echo "Error: " . $conn->error . "<br>";
        }
    }
    // ปิดไฟล์
    fclose($file);
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
    <form action="" method="post" enctype="multipart/form-data" name="formsubject">
        <h3>subject
            <a href="csv/subject.csv" download="subject.csv">
                ดาวน์โหลดโครง subject
            </a>
        </h3>
        <input name="csvSubject" type="file" id="csvSubject" accept=".csv">
        <button type="submit" name="subSubject">submit</button>
        <br>
    </form>
</body>

</html>