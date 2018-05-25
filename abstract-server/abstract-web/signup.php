<html>
<head>
	<link rel="stylesheet" type="text/css" href="abstract.css"/>
</head>
<body class='menu'>
<?php
session_start();


echo "<a href='index.php'><img src='logo.png' class='mid'/></a>";

if (isset($_POST['Register'])) {

	if (empty($_POST['user']) || empty($_POST['email']) || empty($_POST['pass1']) || empty($_POST['pass2'])) {
		echo "<div align='center'>You missed some of the data we need, please fill the form with your personal information.</div><br/>";
		goto form;
	}
	elseif ($_POST['pass1'] != $_POST['pass2']) {
		echo "<div align='center'>The passwords dont match, please try again.</div><br/>";
		goto form;
	}
	elseif (strpos($_POST['email'], '@gmail.com') === false) {
		echo "<div align='center'>The email you have entered is not valid. You need a gmail or iurreta institutua account to sign up.</div>";
		goto form;
	}
	$connect = mysqli_connect ('localhost', 'root', '', 'abstract');
	$select = "select user, mail from users";
	$selectquery = mysqli_query($connect, $select);
	foreach ($selectquery as $i) {
		if ($i['user'] == $_POST['user']) {
			echo "<div align='center'>This username is alredy used, please try using another one.</div><br>";
			goto form;
		}
		elseif ($i['mail'] == $_POST['email']) {
			echo "<div align='center'>This email is alredy registered, try <a class='login' href='recover.php'>recovering yor account</a> or <a class='login' href='register.php'>registering</a> using another email.</div><br><br>";
			goto form;
		}
	}
	$insert = "insert into users(id, user, mail, password) values('', '".$_POST['user']."', '".$_POST['email']."', PASSWORD('".$_POST['pass1']."'))";
	$insertquery = mysqli_query($connect, $insert);
	echo "<div align='center'>Registration has been successful<br><br><form method='post' action='login.php'><input type='submit' class='btn' value='Log in'></form></div>";
	goto postform;
}
form:
echo "<form method='post' action='signup.php'>";
echo "<table align='center' class='register' width='35%'>";
echo "<tr align='center'><td><input type='text' name='user' class='textbox' placeholder='Username'></td></tr>";
echo "<tr align='center'><td><input type='text' name='email' class='textbox' placeholder='Email'></td></tr>";
echo "<tr align='center'><td><input type='password' name='pass1' class='textbox' placeholder='Password'></td></tr>";
echo "<tr align='center'><td><input type='password' name='pass2' class='textbox' placeholder='Confirm Password'></td></tr>";
echo "<tr align='center'><td class='terms'>By clicking on Sign up, you agree to <a class='login' href='terms.html' target='_blank'>Abstract's terms & conditions</a> and <a class='login' href='privacy.html' target='_blank'>privacy policy</td></tr>";
echo "</table><br>";
echo "<table align='center'>";
echo "<tr><td><input type='submit' class='reg' value='SIGN UP' name='Register'/></td></tr>";
echo "<div align='center' class='login'>Alredy have an account? <a class='login' href='login.php'>sign in</a></div>";
echo "</table>";
echo "</form>";
postform:
?>
</body>
</html>
