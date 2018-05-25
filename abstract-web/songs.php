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
		$conect = mysqli_connect('localhost', 'root', '', 'abstract');
		$selectsongs = "select songs.name as song, albums.name as album, artists.name as artist from songs inner join albums_songs on songs.id =albums_songs.song_id inner join albums on albums_songs.album_id = albums.id inner join albums_artists on albums.id = albums_artists.album_id inner join artists on albums_artists.artist_id = artists.id where albums.name='".$_POST['album']."'";
		$selectsubgenre = "select subgenres.name as subgenre from subgenres inner join subgenres_albums on subgenres.id = subgenres_albums.subgenre_id inner join albums on subgenres_albums.album_id = albums.id where albums.name='".$_POST['album']."'";
		$querysubgenre = mysqli_query($conect, $selectsubgenre);
		$fetchsubgenre = mysqli_fetch_assoc($querysubgenre);
		$selectreco = "select albums.name as album from albums inner join subgenres_albums on albums.id = subgenres_albums.album_id inner join subgenres on subgenres_albums.subgenre_id = subgenres.id where subgenres.name='".$fetchsubgenre['subgenre']."' and albums.name != '".$_POST['album']."'";
		$queryreco = mysqli_query($conect, $selectreco);
		$querysongs = mysqli_query ($conect, $selectsongs);

		if (isset($_POST['album'])) {
			echo strtoupper($_POST['album'])."<br><br>";
			    echo "<iframe height='200px' src='player.php' name='player'></iframe>";
			echo "<table>";
			while ($line = mysqli_fetch_array($querysongs)) {
				echo "<tr><td><form name='player' method='post' action='player.php' target='player'><input type='submit' name='player' class='player' value='music/".$line['artist']."/".$line['album']."/".$line['song'].".mp3'></form></td><td><form><font color='c40e0e'>".$line['song']."</font></form></td><td><form method='post' action='songs.php'><input type='submit' name='album' value='".$line['album']."' class='LinkButton'></form></td><td><form method='post' action='albums.php'><input type='submit' name='artist' value='".$line['artist']."' class='LinkButton'></form></td></tr>";
			}
			echo "</table><br><br><br>";
			
			echo "Other albums you might enjoy:<br>";
			echo "<table>";
			while ($line = mysqli_fetch_array($queryreco)) {
				echo "<tr><td><form method='post' action='songs.php'><input type='submit' name='album' value='".$line['album']."' class='LinkButton'></form></td></tr>";
			}
			echo "</table>";
			
		}

		echo "</div>";
}
elseif ($_SESSION['logged'] == false) {
	header("Location: login.php");
}

?>
</body>
</html>
