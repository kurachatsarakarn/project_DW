<?php

require("connect_db.php");
$conn->select_db("kuyfew");

if (isset($_POST["subDepartment"])) {
    $fileTmpPath = $_FILES["csvDepartment"]["tmp_name"];

    // เปิดไฟล์ CSV
    $file = fopen($fileTmpPath, "r");
    //อ่านแถวแรก
    fgetcsv($file);
    // อ่านข้อมูลทีละบรรทัด
    while (($dataCourse = fgetcsv($file)) !== FALSE) {
        // เตรียม SQL statement
        $sql = "INSERT INTO department (
        departmentNameTh,
        departmentNameEng) 
        VALUES ('" . implode("', '", $dataCourse) . "')";

        // ดำเนินการ SQL statement
        if ($conn->query($sql) === FALSE) {
            echo "Error: " . $conn->error . "<br>";
        }
    }
    // ปิดไฟล์
    fclose($file);
}

//add Courses
if (isset($_POST["subCourse"])) {
    $fileTmpPath = $_FILES["csvCourse"]["tmp_name"];

    // เปิดไฟล์ CSV
    $file = fopen($fileTmpPath, "r");
    //อ่านแถวแรก
    fgetcsv($file);
    // อ่านข้อมูลทีละบรรทัด
    while (($dataCourse = fgetcsv($file)) !== FALSE) {
        $departmentNameTh = $dataCourse[0];
        //ดู nameCourseUse ว่า ตรงกับ courseID ไหน
        $sql = mysqli_query($conn, "SELECT * FROM department WHERE departmentNameTh= '$departmentNameTh'");
        if ($row = mysqli_fetch_array($sql)) {
            $dataCourse[0] = $row['departmentId'];

        }
        // เตรียม SQL statement
        $sql = "INSERT INTO course (departmentId,
        nameCourseTh,
        nameCourseUse,
        planCourse ,
        nameCourseEng, 
        nameFullDegreeTh, 
        nameFullDegreeEng,
        nameInitialsDegreeTh , 
        nameInitialsDegreeEng, 
        courseStartYear, 
        courseEndYear, 
        totalCredit, 
        GeneralSubjectCredit, 
        specificSubjectCredit, 
        freeSubjectCredit, 
        coreSubjectCredit, 
        spacialSubjectCredit, 
        selectSubjectCredit, 
        happySubjectCredit, 
        entrepreneurshipSubjectCredit, 
        languageSubjectCredit, 
        peopleSubjectCredit, 
        aestheticsSubjectCredit, 
        internshipHours) 
        VALUES ('" . implode("', '", $dataCourse) . "')";

        // ดำเนินการ SQL statement
        if ($conn->query($sql) === FALSE) {
            echo "Error: " . $conn->error . "<br>";
        }
    }
    // ปิดไฟล์
    fclose($file);
}

//add categories
if (isset($_POST["subCategory"])) {
    $fileTmpPath = $_FILES["csvCategory"]["tmp_name"];

    // เปิดไฟล์ CSV
    $file = fopen($fileTmpPath, "r");
    //อ่านแถวแรก
    fgetcsv($file);

    // อ่านข้อมูลทีละบรรทัด
    while (($data = fgetcsv($file)) !== FALSE) {
        $categoryNameTh = $data[0];
        $categoryNameEng = $data[1];
        $nameCourseUse = $data[2];
        //ดู nameCourseUse ว่า ตรงกับ courseID ไหน
        $sql = mysqli_query($conn, "SELECT * FROM course WHERE nameCourseUse= '$nameCourseUse'");
        if ($row = mysqli_fetch_array($sql)) {
            $courseId = $row['courseId'];

        }

        // เตรียม SQL statement
        $sql = "INSERT INTO category (categoryNameTh,
                                    categoryNameEng,
                                    courseId) 
        VALUES ('$categoryNameTh', '$categoryNameEng','$courseId')";

        // ดำเนินการ SQL statement
        if ($conn->query($sql) === FALSE) {
            echo "Error: " . $conn->error . "<br>";
        }
    }
    // ปิดไฟล์
    fclose($file);
}

if (isset($_POST["subAreas"])) {
    $fileTmpPath = $_FILES["csvAreas"]["tmp_name"];

    // เปิดไฟล์ CSV
    $file = fopen($fileTmpPath, "r");
    //อ่านแถวแรก
    fgetcsv($file);

    // อ่านข้อมูลทีละบรรทัด
    while (($data = fgetcsv($file)) !== FALSE) {
        $subjectAreasNameTh = $data[0];
        $subjectAreasNameEng = $data[1];
        $categoryNameTh = $data[2];
        //ดู nameCourseUse ว่า ตรงกับ courseID ไหน
        $sql = mysqli_query($conn, "SELECT * FROM category WHERE categoryNameTh= '$categoryNameTh'");
        if ($row = mysqli_fetch_array($sql)) {
            $categoryId = $row['categoryId'];

        }

        // เตรียม SQL statement
        $sql = "INSERT INTO subject_areas (subjectAreasNameTh,
                                        subjectAreasNameEng,
                                        categoryId ) 
        VALUES ('$subjectAreasNameTh', '$subjectAreasNameEng','$categoryId ')";

        // ดำเนินการ SQL statement
        if ($conn->query($sql) === FALSE) {
            echo "Error: " . $conn->error . "<br>";
        }
    }
    // ปิดไฟล์
    fclose($file);
}

if (isset($_POST["subSubject"])) {
    $fileTmpPath = $_FILES["csvSubject"]["tmp_name"];

    // เปิดไฟล์ CSV
    $file = fopen($fileTmpPath, "r");
    //อ่านแถวแรก
    fgetcsv($file);

    // อ่านข้อมูลทีละบรรทัด
    while (($data = fgetcsv($file)) !== FALSE) {
        $subjectNameTh = $data[0];
        $subjectNameEng = $data[1];
        $subjectCredit = $data[2];
        $subjectAreasNameTh = $data[3];
        //ดู nameCourseUse ว่า ตรงกับ courseID ไหน
        $sql = mysqli_query($conn, "SELECT * FROM subject_areas WHERE subjectAreasNameTh= '$subjectAreasNameTh'");
        if ($row = mysqli_fetch_array($sql)) {
            $subjectAreasId = $row['subjectAreasId'];

        }

        // เตรียม SQL statement
        $sql = "INSERT INTO subject (subjectNameTh,
                                        subjectNameEng,
                                        subjectCredit,
                                        subjectAreasId  ) 
        VALUES ('$subjectNameTh', '$subjectNameEng','$subjectCredit','$subjectAreasId  ')";

        // ดำเนินการ SQL statement
        if ($conn->query($sql) === FALSE) {
            echo "Error: " . $conn->error . "<br>";
        }
    }
    // ปิดไฟล์
    fclose($file);
}

if (isset($_POST["delete"])) {

    // เตรียม SQL statement
    $sql = "DELETE FROM department";

    // ดำเนินการ SQL statement
    if ($conn->query($sql) === FALSE) {
        echo "Error: " . $conn->error . "<br>";
    }

}



// ปิดการเชื่อมต่อ MySQL
$conn->close();

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <form action="" method="post" enctype="multipart/form-data" name="formDepartment">
        <h3>Department</h3>
        <input name="csvDepartment" type="file" id="csvDepartment" accept=".csv">
        <button type="submit" name="subDepartment">submit</button>
        <br>
        <h3>course</h3>
        <input name="csvCourse" type="file" id="csvCourse" accept=".csv">
        <button type="submit" name="subCourse">submit</button>
        <br>
        <h3>category</h3>
        <input name="csvCategory" type="file" id="csvCategory" accept=".csv">
        <button type="submit" name="subCategory">submit</button>
        <br>
        <h3>Areas</h3>
        <input name="csvAreas" type="file" id="csvAreas" accept=".csv">
        <button type="submit" name="subAreas">submit</button>
        <br>
        <h3>Subject</h3>
        <input name="csvSubject" type="file" id="csvSubject" accept=".csv">
        <button type="submit" name="subSubject">submit</button>
        <br><br>
        <button type="submit" name="delete">ลบข้อมูลทั้งหมด</button>
    </form>

</body>

</html>
