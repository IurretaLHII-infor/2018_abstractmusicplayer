<html>
<head>
	<link rel='stylesheet' href='abstract.css'>
</head>
<body class='menu'>
<?php
session_start();
if ($_SESSION['logged'] == true) {

echo "<div align='center'>";
$conect = mysqli_connect('localhost', 'root', '', 'abstract');
$select = "select * from users where user='".$_SESSION['user']."'";
$query = mysqli_query($conect, $select);
$fetch = mysqli_fetch_assoc($query);
echo "<img src='".$fetch['avatar']."' class='midmyaccount'><br><br>";
if (isset($_POST['avatar'])) {
	echo "<form method='post' action='myaccount.php' enctype='multipart/form-data' name='upload'>";
	echo "Upload you new avatar: <input type='file' name='FileToUpload' id='FileToUpload' value='Select file'>";
	echo "<input type='submit' value='Upload' name='upload'>";
	echo "</form>";
	echo "<a href='myaccount.php' class='login'>Go back</a>";
}
elseif (isset($_POST['upload'])) {
$conect = mysqli_connect('localhost', 'root', '', 'abstract');
	$target_dir="avatars/";
	$target_file=$target_dir.basename($_FILES["FileToUpload"]["name"]);
	$FileType=pathinfo($target_file, PATHINFO_EXTENSION);
	
	if ($FileType != 'png') {
		echo "the file must be a .png image<br>";
		goto end;
	}
			
	move_uploaded_file($_FILES["FileToUpload"]["tmp_name"], "avatars/".$_SESSION['user'].".png");
	echo "<div align='center'>";
	echo basename($_FILES["FileToUpload"]["name"])." has been uploaded<br>";
	$update = "update users set avatar = 'avatars/".$_SESSION['user'].".png' where user = '".$_SESSION['user']."'";
	$query = mysqli_query($conect, $update);
	end:
	echo "<a href='myaccount.php'>Go back</a>";
	echo "</div>";

}
elseif (isset($_POST['email'])) {
	echo "<form method='post' action='myaccount.php'>";
	echo "insert your email: <input type='text' name='newemail' class='textbox2'><br><br>";
	echo "<input type='submit' name='changeemail' value='Change' class='LinkButton'><br><br><a href='myaccount.php' class='login'>Go back</a>";
	echo "</form>";
}
elseif (isset($_POST['changeemail'])) {
	if (empty($_POST['newemail'])) {
		echo "<div align='center'>Please, enter the new e-mail on the box<br><br>";
		echo "<a href='myaccount.php' class='login' class='login'>Go back</a></div>";
	}
	else {
		if (strpos($_POST['newemail'], '@gmail.com') === false) {
			echo "<div align='center'>You need to enter a valid gmail account<br><br><a href='myaccount.php' class='login'>Go back</a></div>";
		}
		else {
			$update = "update users set mail='".$_POST['newemail']."' where user='".$_SESSION['user']."'";
			$query = mysqli_query($conect, $update);
			echo "Your email has been updated<br><br>";
			echo "<a href='myaccount.php' class='login'>Go back</a>";
		}
	}
}
elseif (isset($_POST['pass'])) {
	echo "<form method='post' action='myaccount.php'>";
	echo "Enter old password: <input type='password' name='oldpass' class='textbox2'><br><br>";
	echo "Enter new password: <input type='password' name='newpass1' class='textbox2'><br><br>";
	echo "Confirm password: <input type='password' name='newpass2' class='textbox2'><br><br>";
	echo "<input type='submit' value='Change' name='passwordchange' class='LinkButton'><br><br><a href='myaccount.php' class='login'>Go back</a>";
	echo "</form>";
}
elseif (isset($_POST['passwordchange'])) {
$oldpass = "SELECT PASSWORD(  '".$_POST['oldpass']."' ) AS oldpass";
$queryoldpass = mysqli_query($conect, $oldpass);
$fetcholdpass = mysqli_fetch_assoc($queryoldpass);

	if (empty($_POST ['oldpass'])) {
		echo "<div align='center'>";
		echo "Enter your old password<br>";
		echo "<a href='myaccount.php'  class='login'>Go back</a>";
		echo "</div>";
	}
	else {
		if (empty($_POST['newpass1']) || empty($_POST['newpass2'])) {
			echo "<div align='center'>";
			echo "You need to enter the new password in both boxes<br>";
			echo "<a href='myaccount.php'  class='login'>Go back</a>";
			echo "</div>";
			
		}
		else {
			if ($fetch['password'] != $fetcholdpass['oldpass']) {
				echo "One of the passwords (old or new) is not valid, please try again<br>";
				echo "<a href='myaccount.php'  class='login'>Go back</a>";
			}
			else {
				if ($_POST['newpass1'] != $_POST['newpass2']) {
					echo "<div align='center'>";
					echo "One of the passwords (old or new) is not valid, please try again<br>";
					echo "<a href='myaccount.php'  class='login'>Go back</a>";
					echo "</div>";
				}
				else {
					$update = "update users set password = password('".$_POST['newpass1']."') where user = '".$_SESSION['user']."'";
					$queryup = mysqli_query($conect, $update);
					echo "<div align='center'>";
					echo "Password changed successfuly<br>";
					echo "<a href='myaccount.php' class='login'>Go back</div>";
					echo "</div>";
				}
			}
		}
	}
}
else {
form:
echo "<form method='post' action='myaccount.php'>";
echo "<input type='submit' value='Change Avatar' name='avatar' class='LinkButton'><br><br>";
echo "Username: ".$fetch['user']."<br><br>";
echo "Email: ".$fetch['mail']."<input type='submit' value='Change' name='email' class='LinkButton'><br><br>";
echo "<input type='submit' value='Change password' name='pass' class='LinkButton'><br><br>";
echo "</form>";
echo "<a href='index.php'class='login'>Go back</a>";
}


echo "</div>";
end2:
}
elseif ($_SESSION['logged'] == false) {
	header("Location: login.php");
}

?>
</body>
</html>