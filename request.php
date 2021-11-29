<!-- MSc Computer Science COMP519 - Adam Kent -->

<?php
include 'db.php';

//name validate
if (!preg_match("/--|''|  /",$_REQUEST['user']) && preg_match("/^[a-zA-Z][-' a-zA-Z]+$/",$_REQUEST['user'])) {
    $invalidName = FALSE;
} else {
    $invalidName = TRUE;
}
//email valdiate
if (filter_var($_REQUEST['email'], FILTER_VALIDATE_EMAIL)){
  $invalidemail = FALSE;}
else {
  $invalidemail = TRUE;}

if ($invalidName || $invalidemail ) {
    include 'index.php';
    exit();
}

$pdo->beginTransaction();
try
{
//check space
    $stillSpace = "SELECT * FROM available WHERE researcherid=:researcherid and remain >0" ;
    $stillSpaceQry = $pdo->prepare($stillSpace);
    $stillSpaceQry->execute(array(':researcherid'=>$_REQUEST['researcherSelect']));

    if($stillSpaceQry->rowcount()<=0 )
    {
        echo "There are no copies of this book available";
        include 'index.php';
        exit();
    }

//add new book request into sql database
    $requesting = "INSERT INTO requesting VALUES (:researcherid, :user, :email)";
    $requestingQRY = $pdo->prepare($requesting);
    $requestingQRY->execute(array(':researcherid' => $_REQUEST['researcherSelect'], ':user'=>$_REQUEST['user'],':email'=>$_REQUEST['email'] ));
    if(!$requestingQRY) {
        echo "DATABASE ERROR";
        exit();
        $pdo = NULL;
    }

    echo "<html> <head> <link rel='stylesheet' href='styles3.css'>";
    echo "</head<<body><h3>Requesting has been successful</h3>Details of book request:";
    echo "<br />Book: ".$_REQUEST['selectBook'];
    $daytime = $stillSpaceQry->fetch();
    echo "<br />Researcher: ".$daytime['researcher'];
    echo "<br />User: ".$_REQUEST['user'];
    echo "<br />Email address: ".$_REQUEST['email'];
    echo "</body></html>";

    $pdo->commit();

} catch (Exception $e)
{
    $pdo->rollBack();
}
$pdo = NULL;

?>