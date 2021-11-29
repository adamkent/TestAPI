<!-- MSc Computer Science COMP519 - Adam Kent -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>COMP518: Resit Assignment 3 - PHP</title>
<link rel="stylesheet" href="styles3.css">
</head>
<body>
<header>
<h1>Book Requesting Form</h1>
</header>
<?php

if (!isset($_REQUEST['selectBook'])) {
    $_REQUEST['selectBook'] ="";
}

//get available books
$bookResult = $pdo->query("select DISTINCT description from available where remain>0");
echo "<br />";

if ($bookResult->rowcount()== 0) {
    echo "There are no copies of this book available";
}
else {
    echo "Books available to request:";
//run books.php
    echo "<form action='books.php' method='POST' id='bookform' >";
    echo "<select name='selectBook' onchange='bookform.submit()' form_id='bookform' required> ";
    echo "<option value='' disabled selected> This field won't retain selection but continue to choose researcher after selecting book </option>";

    foreach ($bookResult as $key => $value) {
        echo "<option value='".$value["description"]."'";
        if ($_REQUEST['bookselect'] === $value["description"]){
          echo " selected ";
        }
        echo ">".$value["description"]."</option>";
    }
    echo "</select>   </form>";
}
echo "<form action='request.php' method='POST' id='mainform' >";
//passing values to the form
echo "<input type='hidden' name='selectBook' value='".$_REQUEST['selectBook']."' >";

if (isset($_REQUEST['selectBook'])) {
//only display researchers with available copies
    $researcherResult = $pdo->query("SELECT * FROM available where description='".$_REQUEST['selectBook']."' and remain>0;" );
    echo "<select name='researcherSelect'  form_id='mainform'> ";

    foreach ($researcherResult as $key => $value) {
        echo "<option value='".$value["researcherid"]."'";
        if ((int)$_REQUEST['researcherSelect'] == (int)$value["researcherid"]) {
          echo " selected ";
        }
        echo ">".$value["researcher"]."</option>";
    }
    echo "</select> ";
}
else {
    echo "<select name='researcherSelect'  form_id='mainform' disabled> ";
    echo "<option>Select Book</option>";
    echo "</select> ";
}
echo "<br />";

//type name
echo "<br /> ";
if ($invalidName) {
    echo "<p>A valid name must be entered</p>";
}

echo "<label for='user'>Name: <input type='text' length='50' name='user'";

if (!isset($_REQUEST['selectBook'])){
    echo " disabled ";
}

if (!$invalidName && isset($_REQUEST['user'])){
    echo "value = '".$_REQUEST['user']."' ";
}
echo "></label> <br />";

// email
echo "<br />" ;
if ($invalidemail) {
    echo "<p>Email address is not valid</p>";
}
echo "<label for='user'>Email address: <input type='text' length='20' maxlength='20' name='email'";

if (!isset($_REQUEST['selectBook'])){
    echo " disabled ";
}
//check validity
if (!$invalidemail && isset($_REQUEST['email'])){
    echo "value = '".$_REQUEST['email']."' ";
}
echo "></label> <br />";
echo "<button action='submit'> Request </button>";
?>
</body>
</html>
