<html>
<head>
  	<link rel="stylesheet" type="text/css" href="abstract.css"/>
</head>
<body class='nomenu'>
<?php
session_start();
if (isset($_SESSION['logged'])) {
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
    echo "<li class='menu7'><a class='menu' href='bugreport.php'>Bug report</a></li>";
		echo "<ul class='menu3'>";
		echo "<li class='menu5'><a class='menu3' href='myaccount.php'>My Account</a></li>";
		echo "<li class='menu6'><a class='menu3' href='logout.php'>Logout</a></li>";
      echo "</ul>";
    echo "</ul>";
	echo "</div>";
	echo "<div class='backgroundleft'></div>";

	if (isset($_POST['searching'])) {
		if (empty($_POST['search'])) {
			goto data;
		}
		else {
			 echo "<iframe height='200px' src='player.php' name='player'></iframe>";
		echo "<div class='data'>";
		echo "SUBGENRE<br/><br/>";
		$select = "select * from subgenres where name like '%".$_POST['search']."%'";
		$query = mysqli_query($conect, $select);
		echo "<form name='subgenres' method='post' action='albums.php'>";
		while($line=mysqli_fetch_array($query)) {
			echo "<input type='submit' class='linkButton' name='subgenre' value='".$line['name']."'><br/>";
		}
        echo "</form>";
        echo "<br/>";
		echo "ARTISTS<br><br>";
        $select = "select * from artists where name like '%".$_POST['search']."%'";
        $query = mysqli_query($conect, $select);
        echo "<form name='artist' method='post' action='albums.php'>";
        while($line=mysqli_fetch_array($query)) {
			echo "<input type='submit' class='linkButton' name='artist' value='".$line['name']."'><br/>";
        }
        echo "</form>";
        echo "<br/>";
		echo "ALBUMS<br><br>";
        $select = "select * from albums where name like '%".$_POST['search']."%'";
        $query = mysqli_query($conect, $select);
        echo "<form name='subgenres' method='post' action='songs.php'>";
        while($line=mysqli_fetch_array($query)) {
			echo "<input type='submit' class='linkButton' name='album' value='".$line['name']."'><br/>";
        }
        echo "</form>";
        echo "<br/>";
		echo "SONGS<br><br>";
        $select = "select songs.name as songname,albums.name as albumname,artists.name as artistname from songs inner join albums_songs on songs.id=albums_songs.song_id inner join albums on albums_songs.album_id=albums.id inner join albums_artists on albums.id=albums_artists.album_id inner join artists on albums_artists.artist_id=artists.id where songs.name like '%".$_POST['search']."%'";
        $query = mysqli_query($conect, $select);
		echo "<table width='100%'>";
		while($line=mysqli_fetch_array($query)) {
			echo "<tr>";
      echo "<form name='player' method='post' action='player.php' target='player'>";
			echo "<td valign='top'><input type='submit' name='player' class='player' value='music/".$line['artistname']."/".$line['albumname']."/".$line['songname'].".mp3'></td>";
      echo "</form>";
			echo "<td valign='bottom'><form method='post' action='songs.php'><font color='#c40e0e'>".$line['songname']."</font></form></td>";
			echo "<td valign='bottom'><form method='post' action='songs.php'><input type='submit' class='linkButton' name='album' value='".$line['albumname']."'></form></td>";
			echo "<td valign='bottom'><form method='post' action='artists.php'><input type='submit' class='linkButton' name='artist' value='".$line['artistname']."'></form></td>";
			echo "</tr>";
        }
		echo "</table>";
			echo "</div>";
		}
	}
	else {
	data:
		echo "<div class='data'>";
			echo "<form method='post' action='subgenres.php'>";
				echo "<table align='center' width='80%' height='500'>";
				echo "<tr align='center'>";
				echo "<td><input type='submit' value='Rock' name='genre' class='genre'></td>";
				echo "<td><input type='submit' value='Hip-Hop' name='genre' class='genre'></td>";
				echo "<td><input type='submit' value='Punk' name='genre' class='genre'></td>";
				echo "<td><input type='submit' value='Pop' name='genre' class='genre'></td>";
				echo "</tr>";
				echo "<tr align='center'>";
				echo "<td><input type='submit' value='Reggae' name='genre' class='genre'></td>";
				echo "<td><input type='submit' value='Electronic' name='genre' class='genre'></td>";
				echo "<td><input type='submit' value='Classical' name='genre' class='genre'></td>";
				echo "<td><input type='submit' value='Metal' name='genre' class='genre'></td>";
				echo "</tr>";
				echo "</table>";
			echo "</form>";
		echo "</div>";
	}
  }
  else {
    goto nologged;
  }
}
else {
  nologged:
  echo "<ul class='menu'>";
     echo "<li class='menuphoto'><a class='menuphoto' href='index.php'><img class='menu' src='NLogoDerecha.png'></a></li>";
     echo "<li class='menu'><a class='menu' href='login.php'>Login</a></li>";
     echo "<li class='menu'><a class='menu' href='signup.php'>Sign up</a></li>";
  echo "</ul>";
  echo "<div class='index1'>";
    echo "<img src='portada1.jpg' class='portadamenu1'/>";
    echo "<div class='title1'>Whats Abstract?</div>";
    echo "<div class='text1'>Abstract is a music streaming service, similar to Spotify or Tidal. We pride ourselves on making personalized recomendations based on what the user likes or listens to, recomending not only artists but also albums they might like even though the artist might not suit their taste.<br/><br/>
    The aim of this project is to recomend the user music they really want to listen to, and to help you discover new artists from the genres you like or albums that are very similar to the ones you already love.</div>";

  echo "</div>";
  echo "<div class='index2'>";
    echo "<img src='portada2.jpg' class='portadamenu2'/>";
    echo "<div class='title2'>Why Abstract?</div>";
    echo "<div class='text2'>We are tired of pages or music services that recomend music based on popularity rather than recomending music you will really like. As such, we started Abstract as a project of a music service, with all the things we like from other music services and some improvements in the way this services recomend music to the user.<br/><br/>
    We started Abstract as a free service, because we believe music should be avaliable to everyone in a free way, and we will try to keep it free of cost or advertisments as much time as possible.</div>";
  echo "</div>";

  echo "<div class='index3'>";
    echo "<img src='portada3.jpg' class='portadamenu1'/>";
    echo "<div class='title1'>Features of Abstract</div>";
    echo "<div class='title3'>Search</div>";
    echo "<div class='text3'>Know what you want to listen to? Just search and hit play.</div>";
    echo "<div class='title4'>Discover</div>";
    echo "<div class='text4'>Discover artists or albums with recomendations based on your own preference and musical taste</div>";
    echo "<div class='title4'>Free</div>";
    echo "<div class='text4'>Abstract is cost free and advertisment free, just have fun using it!</div>";
  echo "</div>";
}
?>
</body>
</html>
