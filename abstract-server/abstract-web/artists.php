<html>
<head>
	<link rel='stylesheet' href='abstract.css'>
</head>
<body class='nomenu'>
<?php
session_start();
if ($_SESSION['logged'] == true) {

	$conect = mysqli_connect('localhost', 'root', '', 'abstract');
	$user = "select user, avatar from users where user='".$_SESSION['user']."'";
	$queryuser = mysqli_query($conect, $user);
	$fetchuser = mysqli_fetch_assoc($queryuser);
	
	echo "<hr class='menuleft'>";
	echo "<div class='menuleft'>";
		echo "<a href='index.php'><img src='NLogoDerecha.png' class='menuleft'/></a>";
		echo "<img class='avatar' src='".$fetchuser['avatar']."'/>";
		echo "<div align='center' class='username'><a class='login' href='myaccount.php'>".$fetchuser['user']."</a></div>";
    echo "<ul>";
		echo "<div class='find'><form method='post' action='index.php'><input type='text' class='searchbar' name='search' placeholder='Search'><input type='submit' class='search' name='searching'></form></div>";
		echo "<ul class='menu2'>";
		echo "<li class='menu2'><a class='menu' href='subgenres.php'>Subgenres</a></li>";
		echo "<li class='menu3'><a class='menu' href='artists.php'>Artists</a></li>";
		echo "<li class='menu4'><a class='menu' href='albums.php'>Albums</a></li>";
		echo "<ul class='menu3'>";
		echo "<li class='menu5'><a class='menu3' href='myaccount.php'>My Account</a></li>";
		echo "<li class='menu6'><a class='menu3' href='logout.php'>Logout</a></li>";
      echo "</ul>";
    echo "</ul>";
	echo "</div>";
	echo "<div class='backgroundleft'></div>";
	echo "<div class='data'>";
		echo "<a href='index.php'><img src='logo.png' class='mid'></a>";
		echo "<div align='center'><font color='#c40e0e' size='50'>BETA</font></div><br>";
		echo "<div align='center'>Here you can find the artists you follow, but this part is not ready.</div><br>";
		echo "<div align='center'>Check later</div>";
	echo "</div>";
}
elseif ($_SESSION['logged'] == false) {
	header("Location: login.php");
}

?>
</body>
</html>