
<?php
 ob_start();
 session_start();
 require_once 'dbconnect.php';

 // if session is not set this will redirect to login page
 if( !isset($_SESSION['user']) ) {
  header("Location: index.php");
  exit;
}else{
  $_SESSION['login'] = True;
}
 // select logged-in users detail
 $res=mysqli_query($conn, "SELECT * FROM users WHERE userId=".$_SESSION['user']);
 $userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
<title>Welcome - <?php echo $userRow['firstName']; ?></title>
<style>
	    #header img{
      max-height: 300px;
      width: 100%;
    }
  .imgrow{
    margin-top: 5vh;
  }
  .imgrow img{
    border:2px solid blue;
  }
  .container-fluid{
    background-color: #713A1B;
    color: white;
  }
  @import url('https://fonts.googleapis.com/css?family=Raleway');
    h1{
      font-family: 'Raleway', sans-serif;
      font-size:15pt;
    }










</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

		 <?php echo "<div class=\"container-fluid\">";
            echo "<div class=\"row\" id=\"header\" >";
            echo "<img src=\"http://img.medscapestatic.com/pi/features/slideshow-slide/summerreading2017/fig1.jpg?resize=500:*\" alt=\"problem loading :((\">";
            echo" </div>" ; //header 
            echo "<div class=\"row\">";
            echo "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-9\">";
            echo "<img class=\"img-responsive\" src=\"0.png"."\">";
            echo "</div>";
            echo "</div>";
            echo "<div class=\"row\">";
              echo "<div class=\"col-lg-6 col-md-6 col-sm-6 col-xs-6\">";
              echo "<h1>" . "Welcome" ." ".$userRow['firstName']. "!"."</h1>";
              echo "</div>";
              echo "<div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-3\">";
              echo "<img class=\"img-responsive\" src=\"".$userRow['photolink'] ."\">";
              echo "<a href=\"logout.php?logout\">Sign Out</a>";
              echo "</div>";
              echo "</div>";
            ?>
       
         <?php

		$book_id= $_GET["id"];
		$res=mysqli_query($conn, "SELECT * FROM book WHERE ISBN=" . $book_id);
 		$userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);
 		
 		echo "<div class=\"row\">";
 		echo "<div class=\"col-md-12\">";
 		echo "<img class=\"img-responsive\" style='width:200px; height:250px' src='" . $userRow['photoLink']. "'>";
		echo "<h2>".$userRow['titel']."</h2>"; 
		echo "<h3>".$userRow['author']."<b>"."</h3>"; 
		echo "<p>".$userRow['genre']."</p>"; 
		echo "<p>".$userRow['description']."</p>";
        echo "</div>";
        echo "</div>";
        echo "<a href=\"bookList.php\">Back to books list</a>";
        echo "</div>";
         ?>
          
</body>
</html>
<?php ob_end_flush(); ?>