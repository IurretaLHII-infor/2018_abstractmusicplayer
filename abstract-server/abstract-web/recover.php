<html>
<head>
<link rel="stylesheet" type="text/css" href="abstract.css"/>
</head>
<body>
<?php
session_start();
echo "<a href='index.php'><img class='mid' src='logo.png'/></a>";
if (isset($_POST['recover'])) {
	$conect = mysqli_connect('localhost', 'root', '', 'abstract');
	$select = "select user, mail, password from users where user='".$_POST['recouser']."'";
	$querydb = mysqli_query($conect, $select);
	$fetchdb = mysqli_fetch_assoc($querydb);
	if ($fetchdb['user'] == $_POST['recouser'] && $fetchdb['mail'] == $_POST['recoemail']) {
		echo "<div align='center'>";
		echo "Username: ".$fetchdb['user']."<br><br>";
		echo "E-mail: ".$fetchdb['mail']."<br><br>";
		echo "Password: ".$fetchdb['password']."<br><br>";
		echo "<form method='post' action='login.php'><input type='submit' value='Log in' class='btn'></form>";
		echo "</div>";
	}
	else {
	echo "<div align='center'>The user doesn't exist, or the email and username don't match, try again</div><br>";
	goto recover;
	}
}
else {
	recover:
	echo "<form method='post' action='recover.php'>";
	echo "<table style='margin:auto'>";
	echo "<tr align='center'><td><b>Password Reset</b></td></tr>";
	echo "<tr><td></td></tr>";
	echo "<tr><td></td></tr>";
	echo "<tr align='center'><td>Enter your <font color='c40e0e'>Abstract username</font>, and the <font color='c40e0e'>email address</font> that you used to register. <br>If they match, we will send you the password.</td></tr>";
	echo "<tr><td></td></tr>";
	echo "<tr><td></td></tr>";
	echo "<tr><td></td></tr>";
	echo "<tr><td></td></tr>";
	echo "<tr align='center'><td><input class='textbox' type='text' name='recouser' placeholder='Enter your username'></td></tr>";
	echo "<tr align='center'><td><input type='text' class='textbox' name='recoemail' placeholder='Enter your email'></td></tr>";
	echo "<tr><td></td></tr>";
	echo "<tr><td></td></tr>";
	echo "<tr align='center'><td><input type='submit' class='reg' value='Send' name='recover'></td></tr>";
	echo "<tr><td></td></tr>";
	echo "<tr><td></td></tr>";
	echo "<tr><td></td></tr>";
	echo "</table>";
	echo "</form>";
}

?>
</body>
</html>