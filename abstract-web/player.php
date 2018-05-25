<html>
<head>
		<link rel="stylesheet" type="text/css" href="abstract.css"/>
	</head>
</head>
<body>

<?php
if (isset($_POST['player'])) {
$song=$_POST['player'];
if(file_exists($song)){
echo "<div class='player'>";
	echo "<audio src='$song' preload='none' controls autoplay></audio>";
	echo "</div>";}
	else{
		/*echo "<div class='player'>";
		echo "<div align='center'>We dont have this song avaliable,return later</div>";
		echo "</div>";*/

	}
}
else{
$song='';
}

?>
</body>
</html>
