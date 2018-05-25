<html>
<head>
	<link rel="stylesheet" type="text/css" href="abstract.css"/>
</head>
<body class='menu'>
<?php
session_start();
if ($_SESSION['logged'] == true) {

	if (isset($_POST['sendbug'])) {
		$conect = mysqli_connect('localhost', 'root', '', 'abstract');
		$insert = "insert into bugs values('', '".$_SESSION['user']."', '".$_POST['bug']."')";
		$query = mysqli_query($conect, $insert);
		echo "<a href='index.php'><img class='mid' src='logo.png'/></a>";
		echo "<div align='center'>Thanks for helping us improve Abstract.<br><br>";
		echo "<a class='login' href='index.php'>Return</a></div>";
		goto end;
	}
	echo "<a href='index.php'><img src='logo.png' class='mid'></a>";
	echo "<div align='center'>Help us improve Abstract by reporting bugs</div><br><br>";
	echo "<div align='center'><form method='post' action='bugreport.php'>";
	echo "<textarea rows='4' cols='70' name='bug' placeholder='Tell us any kind of bug you find'></textarea><br><br><input type='submit' class='btn'value='Send report' name='sendbug'>";
	echo "</form></div>";
	end:
}
else {
	header("Location: login.php");
}
?>
</body>
</html>
