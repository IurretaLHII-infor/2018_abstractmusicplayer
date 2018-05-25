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
	if (isset($_POST['artist'])) {
		$conect = mysqli_connect('localhost', 'root', '', 'abstract');
		$selectalbums = "select albums.name from albums inner join albums_artists on albums.id = albums_artists.album_id inner join artists on albums_artists.artist_id = artists.id where artists.name='".$_POST['artist']."'";
		$queryalbums = mysqli_query($conect, $selectalbums);
		echo strtoupper($_POST['artist'])."<br><br>";
		echo "<form method='post' action='songs.php'>";
		while($line = mysqli_fetch_array($queryalbums)) {
			echo "<input type='submit' class='LinkButton' name='album' value='".$line['name']."'><br>";
		}
		echo "</form>";
	}
	elseif (isset($_POST['subgenre'])) {
		$conect = mysqli_connect('localhost', 'root', '', 'abstract');
		$selectalbums = "select albums.name from albums inner join subgenres_albums on albums.id = subgenres_albums.album_id inner join subgenres on subgenres_albums.subgenre_id = subgenres.id where subgenres.name='".$_POST['subgenre']."';";
		$queryalbums = mysqli_query($conect, $selectalbums);
		echo strtoupper($_POST['subgenre'])."<br><br>";
		echo "<form method='post' action='songs.php'>";
		while($line = mysqli_fetch_array($queryalbums)) {
			echo "<input type='submit' class='LinkButton' name='album' value='".$line['name']."'><br>";
		}
		echo "</form>";
	}

	else {
		echo "<a href='index.php'><img src='logo.png' class='mid'></a>";
		echo "<div align='center'><font color='#c40e0e' size='50'>BETA</font></div><br>";
		echo "<div align='center'>Here you can find the albums you follow, but this part is not ready.</div><br>";
		echo "<div align='center'>Check later</div>";
	}
	echo "</div>";
	}
	elseif ($_SESSION['logged'] == false) {
		header("Location: login.php");
	}



?>
</body>
</html>
