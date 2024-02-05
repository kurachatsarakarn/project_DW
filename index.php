<?php
require("connect_db.php");
$conn->select_db("kuyfew");
//add Courses
if (isset($_POST["subCourse"])) {
    $fileTmpPath = $_FILES["csvCourse"]["tmp_name"];

    // เปิดไฟล์ CSV
    $file = fopen($fileTmpPath, "r");
    //อ่านแถวแรก
    fgetcsv($file);
    // อ่านข้อมูลทีละบรรทัด
    while (($dataCourse = fgetcsv($file)) !== FALSE) {
        // เตรียม SQL statement
        $sql = "INSERT INTO course (department,
        nameCourseTh,
        nameCourseUse,
        planCourse ,
        nameCourseEng, 
        nameFullDegreeTh, 
        nameFullDegreeEng,
        nameInitialsDegreeTh, 
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
        if($row = mysqli_fetch_array($sql)) {
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
        $categoryNameTh  = $data[2];
        //ดู nameCourseUse ว่า ตรงกับ courseID ไหน
        $sql = mysqli_query($conn, "SELECT * FROM category WHERE categoryNameTh= '$categoryNameTh'");
        if($row = mysqli_fetch_array($sql)) {
            $categoryId  = $row['categoryId'];

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
        $subjectAreasNameTh  = $data[2];
        //ดู nameCourseUse ว่า ตรงกับ courseID ไหน
        $sql = mysqli_query($conn, "SELECT * FROM subject_areas WHERE subjectAreasNameTh= '$subjectAreasNameTh'");
        if($row = mysqli_fetch_array($sql)) {
            $subjectAreasId   = $row['subjectAreasId'];

        }

        // เตรียม SQL statement
        $sql = "INSERT INTO subject (subjectNameTh,
                                        subjectNameEng,
                                        subjectAreasId  ) 
        VALUES ('$subjectNameTh', '$subjectNameEng','$subjectAreasId  ')";

        // ดำเนินการ SQL statement
        if ($conn->query($sql) === FALSE) {
            echo "Error: " . $conn->error . "<br>";
        }
    }
    // ปิดไฟล์
    fclose($file);
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
    <form action="" method="post" enctype="multipart/form-data" name="formCourse">
        <h3>course</h3>
        <input name="csvCourse" type="file" id="csvCourse" accept=".csv">
        <button type="submit" name="subCourse">submit</button>
    </form><br>
    <form action="" method="post" enctype="multipart/form-data" name="formCategory">
        <h3>category</h3>
        <input name="csvCategory" type="file" id="csvCategory" accept=".csv">
        <button type="submit" name="subCategory">submit</button>
    </form>
    <form action="" method="post" enctype="multipart/form-data" name="formAreas">
        <h3>Areas</h3>
        <input name="csvAreas" type="file" id="csvAreas" accept=".csv">
        <button type="submit" name="subAreas">submit</button>
    </form>
    <form action="" method="post" enctype="multipart/form-data" name="formSubject">
        <h3>Areas</h3>
        <input name="csvSubject" type="file" id="csvSubject" accept=".csv">
        <button type="submit" name="subSubject">submit</button>
    </form>
    <form action = "course.php">
        <br><br><button name = course >Addcourse</button>

    </form>
    <form action = "category.php">
        <br><br><button name = course >Addcategory</button>

    </form>
    <form action = "subject_areas.php">
        <br><br><button name = course >Addsubject_areas</button>

    </form>
    <form action = "subject.php">
        <br><br><button name = course >Addsubject</button>

    </form>
</body>

</html>