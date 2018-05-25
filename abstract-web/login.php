<html>
<head>
	<link rel="stylesheet" type="text/css" href="abstract.css"/>
</head>
<body class='menu'>

<?php
session_start();

echo "<a href='index.php'><img class='mid' src='logo.png'/></a>";

//REINICIAR LA SESION

$_SESSION['logged']=false;

//CONEXION DE MYSQL

if (empty($_POST['login'])) {
	login:
	$konex=mysqli_connect('localhost', 'root', '', 'abstract');
	$select="select user, mail, password from users";
	$query=mysqli_query($konex, $select);

	//FORMULARIO



	echo "<form name='index' action='login.php' method='POST'>";
	echo "<table style='margin:auto'>";
	echo "<tr align='center'><td><input class='textbox' type='text' name='usr' placeholder='Username or email address' size='30'></td></tr>";
	echo "<tr></tr>";
	echo "<tr></tr>";
	echo "<tr align='center'><td><input class='textbox' type='password' name='pass' placeholder='Password' size='35'></td></tr>";
	echo "</table>";
	echo "<table align='center' class='login'>";
	echo "<tr align='center'><td width='155'><font>Don't have an account?<br/><a href='signup.php' class='login'>Sign up</a></font></td><td width='100'><input type='submit' class='btn' value='Login' name='login'></td></tr>";
	echo "</table>";
	echo "<table align='center' class='recover'>";
	echo "<tr align='center'> <td colspan='2'><a href='recover.php' class='login'>Forgot your username or password?</a></td></tr>";
	echo "</table>";
	echo "</form>";

}

	//GUARDAR USUARIO-CONTRASEÑA EN VARIABLE


elseif (isset($_POST['login'])) {

	$konex=mysqli_connect('localhost', 'root', '', 'abstract');
	
	if (isset($_POST['usr'])) {
		$selectuser = "select user from users where user = '".$_POST['usr']."' or mail='".$_POST['usr']."'";
		$userquery = mysqli_query($konex, $selectuser);
		$fetchuser = mysqli_fetch_assoc($userquery);
		$_SESSION['user']=$fetchuser['user'];
	}
	else {
		$_SESSION['user']='';
	}
	if (isset($_POST['pass'])) {
		$pass=$_POST['pass'];
	}
	else {
		$pass='';
	}

	//CONEXION MYSQL-SENTENCIAS

	
	$select="select user, mail, password from users where user='".$_SESSION['user']."' or mail='".$_SESSION['user']."'";
	$selectform = "select PASSWORD('".$pass."') as pass";
	$query1=mysqli_query($konex, $select);
	$query2 = mysqli_query($konex, $selectform);
	$dbpass=mysqli_fetch_assoc($query1);
	$formpass = mysqli_fetch_assoc($query2);

	//COMPROBACION USUARIO-CONTRASEÑA

	if ($dbpass['password'] === $formpass['pass']) {
		$_SESSION['logged']=true;
		header("Location: index.php");
	}
	else {
		echo "<div align='center'>Wrong username or password</div>";
		goto login;
	}
}

?>
</body>
</html>
