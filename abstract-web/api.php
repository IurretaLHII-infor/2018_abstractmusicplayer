<?php
//Add class for encoding and decoding JWT

function my_autoloader($class) {
    $parts = explode("\\", $class);
    $classname=     '/var/www/abstract/vendor/firebase/php-jwt/src/' . $parts[count($parts)-1] . '.php';
//    var_dump($classname);
    require_once($classname);
}

spl_autoload_register('my_autoloader');
include "/var/www/abstract/MyDB.php";

// get the HTTP method, path and body of the request
$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
$input = json_decode(file_get_contents('php://input'),true);
// retrieve the table and key from the path
$table = preg_replace('/[^a-z0-9_]+/i','',array_shift($request));
//$key = array_shift($request)+0;
$key = array_shift($request)+0;

switch($table){
case 'songs':
    general($method, $request, $input, $table, $key);
    break;
case 'albums':
    general($method, $request, $input, $table, $key);
    break;
case 'artists':
    general($method, $request, $input, $table, $key);
    break; 
case 'genres':
    general($method, $request, $input, $table, $key);
    break;
case 'playlists':
    general($method, $request, $input, $table, $key);
    break;
case 'subgenres':
    general($method, $request, $input, $table, $key);
    break;
case 'subgenresbygenre':
    subgenresbygenre($method, $request, $input, $table, $key);
    break;
case 'artistsbyalbum':
    artistsbyalbum($method, $request, $input, $table, $key);
    break;
case 'albumsbyartist':
    albumsbyartist($method, $request, $input, $table, $key);
    break;
case 'songsbyalbum':
    songsbyalbum($method, $request, $input, $table, $key);
    break;
case 'songsbyartist':
    songsbyartist($method, $request, $input, $table, $key);
    break;
case 'songsbysubgenre':
    songsbysubgenre($method, $request, $input, $table, $key);
    break;
case 'artistsbygenre':
    artistsbygenre($method, $request, $input, $table, $key);
    break;
case 'registeruser':
    registeruser($method, $request, $input, $table, $key);
    break;
case 'login':
    login($method, $request, $input, $table, $key);
    break;
case 'playsong':
    playsong($method, $request, $input, $table, $key);
    break;
case 'songinformation':
    songinformation($method, $request, $input, $table, $key);
    break;
case 'albumsbysubgenre':
    albumsbysubgenre($method, $request, $input, $table, $key);
    break;
default:
    http_response_code(405);
}

function general($method, $request, $input, $table, $key){
$authresult = authdecode();
// connect to the mysql database
//$link = mysqli_connect('localhost', 'root', 'root', 'abstractapitest');
$db = new MyDB(); 
$link = $db->getDB();
mysqli_set_charset($link,'utf8');


// escape the columns and values from the input object
$columns = preg_replace('/[^a-z0-9_]+/i','',array_keys($input));
if($input == null){
    $values = [];
}
else{
$values = array_map(function ($value) use ($link) {
    if ($value===null) return null;
        return mysqli_real_escape_string($link,(string)$value);
},array_values($input));
}
// build the SET part of the SQL command
$set = '';
for ($i=0;$i<count($columns);$i++) {
$set.=($i>0?',':'').'`'.$columns[$i].'`=';
$set.=($values[$i]===null?'NULL':'"'.$values[$i].'"');
}

// create SQL based on HTTP method
switch ($method) {
case 'GET':  
    $sql = "select * from `$table`".($key?" WHERE id=$key":''); 
    break;
default:
    $sql = "";
    http_response_code(403);
    break;
}

// excecute SQL statement
$result = mysqli_query($link,$sql);

// Get number of rows, if its more than one then its an array and needs []
$numresult = mysqli_num_rows($result);

// die if SQL statement failed
if (!$result) {
    http_response_code(404);
//die(mysqli_error());
}

// print results, insert id or affected row count
if ($method == 'GET') {

echo '[';
echo '['.json_encode($authresult).']';
//Add a comma to separate the auth array from the response array
echo ",";
echo '[';
for ($i=0;$i<$numresult;$i++) {
echo ($i>0?',':'').json_encode(mysqli_fetch_object($result));
//var_dump($request, $key, $table, $columns, $values); 
}
//if ($numresult > 1) 
echo ']';
echo ']';
} elseif ($method == 'POST') {
echo mysqli_insert_id($link);
} else {
echo mysqli_affected_rows($link);
}

// close mysql connection
mysqli_close($link);
}


function artistsbyalbum($method, $request, $input, $table, $key){
$authresult = authdecode();    
// connect to the mysql database
//$link = mysqli_connect('localhost', 'root', 'root', 'abstractapitest');
$db = new MyDB(); 
$link = $db->getDB();
mysqli_set_charset($link,'utf8');
$numresult = 0;

// escape the columns and values from the input object
$columns = preg_replace('/[^a-z0-9_]+/i','',array_keys($input));
$values = array_map(function ($value) use ($link) {
if ($value===null) return null;
return mysqli_real_escape_string($link,(string)$value);
},array_values($input));

// build the SET part of the SQL command
$set = '';
for ($i=0;$i<count($columns);$i++) {
$set.=($i>0?',':'').'`'.$columns[$i].'`=';
$set.=($values[$i]===null?'NULL':'"'.$values[$i].'"');
}

// create SQL based on HTTP method
switch ($method) {
case 'GET':
    if($key != 0){
    $sql = "SELECT artists.* from artists inner join albums_artists on artists.id = albums_artists.artist_id 
    inner join albums on albums_artists.album_id = albums.id".($key?" WHERE albums.id=$key":'');
    }
    else{
    $sql = "";
    }
    break;
default:
    $sql = "";
    break;
}


// excecute SQL statement
$result = mysqli_query($link,$sql);


// Get number of rows, if its more than one then its an array and needs []
$numresult = mysqli_num_rows($result);

// die if SQL statement failed
if (!$result) {
http_response_code(404);
//die(mysqli_error());
}

// print results, insert id or affected row count
if ($method == 'GET') {
echo '[';
echo '['.json_encode($authresult).']';
//Add a comma to separate the auth array from the response array
echo ",";
echo '[';
for ($i=0;$i<$numresult;$i++) {
echo ($i>0?',':'').json_encode(mysqli_fetch_object($result));
//var_dump($request, $key, $table, $columns, $values); 
}
echo ']';
echo ']';
} elseif ($method == 'POST') {
echo mysqli_insert_id($link);
} else {
echo mysqli_affected_rows($link);
}

// close mysql connection
mysqli_close($link);
}



function albumsbyartist($method, $request, $input, $table, $key){
$authresult = authdecode();
// connect to the mysql database
//$link = mysqli_connect('localhost', 'root', 'root', 'abstractapitest');
$db = new MyDB(); 
$link = $db->getDB();
mysqli_set_charset($link,'utf8');
$numresult = 0;

// escape the columns and values from the input object
$columns = preg_replace('/[^a-z0-9_]+/i','',array_keys($input));
$values = array_map(function ($value) use ($link) {
if ($value===null) return null;
return mysqli_real_escape_string($link,(string)$value);
},array_values($input));

// build the SET part of the SQL command
$set = '';
for ($i=0;$i<count($columns);$i++) {
$set.=($i>0?',':'').'`'.$columns[$i].'`=';
$set.=($values[$i]===null?'NULL':'"'.$values[$i].'"');
}

// create SQL based on HTTP method
switch ($method) {
case 'GET':
    $sql = "SELECT albums.* from albums inner join albums_artists on albums.id = albums_artists.album_id 
    inner join artists on albums_artists.artist_id = artists.id".($key?" WHERE artists.id=$key":'');
    break;
default:
    $sql = "";
    break;
}


// excecute SQL statement
$result = mysqli_query($link,$sql);


// Get number of rows, if its more than one then its an array and needs []
$numresult = mysqli_num_rows($result);

// die if SQL statement failed
if (!$result) {
http_response_code(404);
die(mysqli_error());
}

// print results, insert id or affected row count
if ($method == 'GET') {
echo '[';
echo '['.json_encode($authresult).']';
//Add a comma to separate the auth array from the response array
echo ",";
echo '[';
for ($i=0;$i<$numresult;$i++) {
echo ($i>0?',':'').json_encode(mysqli_fetch_object($result));
//var_dump($request, $key, $table, $columns, $values); 
}
echo ']';
echo ']';
} elseif ($method == 'POST') {
echo mysqli_insert_id($link);
} else {
echo mysqli_affected_rows($link);
}

// close mysql connection
mysqli_close($link);
}



function songsbyalbum($method, $request, $input, $table, $key){
$authresult = authdecode();
// connect to the mysql database
//$link = mysqli_connect('localhost', 'root', 'root', 'abstractapitest');
$db = new MyDB(); 
$link = $db->getDB();
mysqli_set_charset($link,'utf8');
$numresult = 0;

// escape the columns and values from the input object
$columns = preg_replace('/[^a-z0-9_]+/i','',array_keys($input));
$values = array_map(function ($value) use ($link) {
if ($value===null) return null;
return mysqli_real_escape_string($link,(string)$value);
},array_values($input));

// build the SET part of the SQL command
$set = '';
for ($i=0;$i<count($columns);$i++) {
$set.=($i>0?',':'').'`'.$columns[$i].'`=';
$set.=($values[$i]===null?'NULL':'"'.$values[$i].'"');
}

// create SQL based on HTTP method
switch ($method) {
case 'GET':
    $sql = "SELECT songs.* from songs inner join albums_songs on songs.id = albums_songs.song_id 
    inner join albums on albums_songs.album_id = albums.id".($key?" WHERE albums.id=$key":'');
    break;
default:
    $sql = "";
    break;
}

// excecute SQL statement
$result = mysqli_query($link,$sql);

// Get number of rows, if its more than one then its an array and needs []
$numresult = mysqli_num_rows($result);

// die if SQL statement failed
if (!$result) {
http_response_code(404);
die(mysqli_error());
}

// print results, insert id or affected row count
if ($method == 'GET') {
echo '[';
echo '['.json_encode($authresult).']';
//Add a comma to separate the auth array from the response array
echo ",";
echo '[';
for ($i=0;$i<$numresult;$i++) {
echo ($i>0?',':'').json_encode(mysqli_fetch_object($result));
//var_dump($request, $key, $table, $columns, $values); 
}
echo ']';
echo ']';
} elseif ($method == 'POST') {
echo mysqli_insert_id($link);
} else {
echo mysqli_affected_rows($link);
}

// close mysql connection
mysqli_close($link);
}


function songsbyartist($method, $request, $input, $table, $key){
$authresult = authdecode();    
// connect to the mysql database
//$link = mysqli_connect('localhost', 'root', 'root', 'abstractapitest');
$db = new MyDB(); 
$link = $db->getDB();
mysqli_set_charset($link,'utf8');
$numresult = 0;

// escape the columns and values from the input object
$columns = preg_replace('/[^a-z0-9_]+/i','',array_keys($input));
$values = array_map(function ($value) use ($link) {
if ($value===null) return null;
return mysqli_real_escape_string($link,(string)$value);
},array_values($input));

// build the SET part of the SQL command
$set = '';
for ($i=0;$i<count($columns);$i++) {
$set.=($i>0?',':'').'`'.$columns[$i].'`=';
$set.=($values[$i]===null?'NULL':'"'.$values[$i].'"');
}

// create SQL based on HTTP method
switch ($method) {
case 'GET':
    $sql = "SELECT songs.* from songs INNER JOIN albums_songs ON songs.id = albums_songs.song_id INNER JOIN albums 
            ON albums_songs.album_id = albums.id INNER JOIN albums_artists ON albums.id = albums_artists.album_id 
            INNER JOIN artists ON albums_artists.artist_id = artists.id".($key?" WHERE artists.id=$key":'');
    break;
default:
    $sql = "";
    break;
}

// excecute SQL statement
$result = mysqli_query($link,$sql);

// Get number of rows, if its more than one then its an array and needs []
$numresult = mysqli_num_rows($result);

// die if SQL statement failed
if (!$result) {
http_response_code(404);
die(mysqli_error());
}

// print results, insert id or affected row count
if ($method == 'GET') {
echo '[';
echo '['.json_encode($authresult).']';
//Add a comma to separate the auth array from the response array
echo ",";
echo '[';
for ($i=0;$i<$numresult;$i++) {
echo ($i>0?',':'').json_encode(mysqli_fetch_object($result));
//var_dump($request, $key, $table, $columns, $values); 
}
echo ']';
echo ']';
} elseif ($method == 'POST') {
echo mysqli_insert_id($link);
} else {
echo mysqli_affected_rows($link);
}

// close mysql connection
mysqli_close($link);
}


function songsbysubgenre($method, $request, $input, $table, $key){
$authresult = authdecode();    
// connect to the mysql database
//$link = mysqli_connect('localhost', 'root', 'root', 'abstractapitest');
$db = new MyDB(); 
$link = $db->getDB();
mysqli_set_charset($link,'utf8');
$numresult = 0;

// escape the columns and values from the input object
$columns = preg_replace('/[^a-z0-9_]+/i','',array_keys($input));
$values = array_map(function ($value) use ($link) {
if ($value===null) return null;
return mysqli_real_escape_string($link,(string)$value);
},array_values($input));

// build the SET part of the SQL command
$set = '';
for ($i=0;$i<count($columns);$i++) {
$set.=($i>0?',':'').'`'.$columns[$i].'`=';
$set.=($values[$i]===null?'NULL':'"'.$values[$i].'"');
}

// create SQL based on HTTP method
switch ($method) {
case 'GET':
    $sql = "SELECT songs.* from songs INNER JOIN albums_songs ON songs.id = albums_songs.song_id INNER JOIN albums 
            ON albums_songs.album_id = albums.id INNER JOIN albums_artists ON albums.id = albums_artists.album_id 
            INNER JOIN artists ON albums_artists.artist_id = artists.id".($key?" WHERE artists.id=$key":'');
    break;
default:
    $sql = "";
    break;
}

// excecute SQL statement
$result = mysqli_query($link,$sql);

// Get number of rows, if its more than one then its an array and needs []
$numresult = mysqli_num_rows($result);

// die if SQL statement failed
if (!$result) {
http_response_code(404);
die(mysqli_error());
}

// print results, insert id or affected row count
if ($method == 'GET') {
echo '[';
echo '['.json_encode($authresult).']';
//Add a comma to separate the auth array from the response array
echo ",";
echo '[';
for ($i=0;$i<$numresult;$i++) {
echo ($i>0?',':'').json_encode(mysqli_fetch_object($result));
//var_dump($request, $key, $table, $columns, $values); 
}
echo ']';
echo ']';
} elseif ($method == 'POST') {
echo mysqli_insert_id($link);
} else {
echo mysqli_affected_rows($link);
}

// close mysql connection
mysqli_close($link);
}

function artistsbygenre($method, $request, $input, $table, $key){
$authresult = authdecode();    
// connect to the mysql database
//$link = mysqli_connect('localhost', 'root', 'root', 'abstractapitest');
$db = new MyDB(); 
$link = $db->getDB();
mysqli_set_charset($link,'utf8');
$numresult = 0;

// escape the columns and values from the input object
$columns = preg_replace('/[^a-z0-9_]+/i','',array_keys($input));
$values = array_map(function ($value) use ($link) {
if ($value===null) return null;
return mysqli_real_escape_string($link,(string)$value);
},array_values($input));

// build the SET part of the SQL command
$set = '';
for ($i=0;$i<count($columns);$i++) {
$set.=($i>0?',':'').'`'.$columns[$i].'`=';
$set.=($values[$i]===null?'NULL':'"'.$values[$i].'"');
}

// create SQL based on HTTP method
switch ($method) {
case 'GET':
    $sql = "SELECT artists.* from artists INNER JOIN genres_artists ON artists.id = genres_artists.artist_id
            INNER JOIN genres ON genres_artists.genre_id = genres.id".($key?" WHERE genres.id=$key":'');
    break;
default:
    $sql = "";
    break;
}

// excecute SQL statement
$result = mysqli_query($link,$sql);

// Get number of rows, if its more than one then its an array and needs []
$numresult = mysqli_num_rows($result);

// die if SQL statement failed
if (!$result) {
http_response_code(404);
die(mysqli_error());
}

// print results, insert id or affected row count
if ($method == 'GET') {
echo '[';
echo '['.json_encode($authresult).']';
//Add a comma to separate the auth array from the response array
echo ",";
echo '[';
for ($i=0;$i<$numresult;$i++) {
echo ($i>0?',':'').json_encode(mysqli_fetch_object($result));
//var_dump($request, $key, $table, $columns, $values); 
}
echo ']';
echo ']';
} elseif ($method == 'POST') {
echo mysqli_insert_id($link);
} else {
echo mysqli_affected_rows($link);
}

// close mysql connection
mysqli_close($link);
}

function registeruser($method, $request, $input, $table, $key){
// connect to the mysql database
//$link = mysqli_connect('localhost', 'root', 'root', 'abstractapitest');
$db = new MyDB(); 
$link = $db->getDB();
mysqli_set_charset($link,'utf8');
$numresult = 0;
// Create an array to respons to the app via json 
$response = array();

// escape the columns and values from the input object
$columns = preg_replace('/[^a-z0-9_]+/i','',array_keys($input));
$values = array_map(function ($value) use ($link) {
if ($value===null) return null;
return mysqli_real_escape_string($link,(string)$value);
},array_values($input));

// build the SET part of the SQL command
$set = '';
for ($i=0;$i<count($columns);$i++) {
$set.=($i>0?',':'').'`'.$columns[$i].'`=';
$set.=($values[$i]===null?'NULL':'"'.$values[$i].'"');
}

// create SQL based on HTTP method
switch ($method) {
case 'POST':
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    //Check if username string has special characters, allow '_' and '-'
    $sql = null;
    if (preg_match('/[\'^£$%&*()}{@#~?><>,|=+¬]/', $username)){
        header('Content-type: application/json');
        $response[0] = array(
            'responseid' => '0',
            'description'=> 'Username has special character, which is not permited'
        );
    }
    elseif(empty($username) == true){
        $response[0] = array(
            'responseid' => '0',
            'description'=> 'Username is empty, which is not permited'
        );
        
    }
    else{
        //Check if password string has ' as a character
        if (preg_match('/[\']/', $password)){
            header('Content-type: application/json');
                $response[0] = array(
                    'responseid' => '0',
                    'description'=> 'Password has the simple quote as a character, which is not permited'
                );
        }
        elseif(empty($password) == true){
            $response[0] = array(
                'responseid' => '0',
                'description'=> 'Password is empty, which is not permited'
            );
        
        }
        else{
            //Check if email has special characters, allow '_', '-' and '@'
            if (preg_match('/[\'^£$%&*()}{#~?><>,|=+¬]/', $email)){
                header('Content-type: application/json');
                $response[0] = array(
                    'responseid' => '0',
                    'description'=> 'Email has special character, which is not permited'
                );
            } 
            elseif(empty($email) == true){
                $response[0] = array(
                    'responseid' => '0',
                    'description'=> 'Email is empty, which is not permited'
                );
            }
            else{
                $compuser = "SELECT * FROM users WHERE user = '".$username."' LIMIT 1";
                //$compuser = "SELECT * FROM users LIMIT 1";
                $resultusercomp = mysqli_query($link, $compuser);
                
                if (!$resultusercomp) {
                    http_response_code(500);
                    $response = array(
                        'responseid' => '0',
                        'description'=> 'Unexpected error, please, try again later'
                    );
                }
                else{
                    if(mysqli_num_rows($resultusercomp) > 0){
                        $response[0] = array(
                            'responseid' => '0',
                            'description'=> 'User already exists, try another one'
                        );
                    }
                    else{
                        $compmail = "SELECT * FROM users WHERE mail = '".$email."'";
                        $resultmailcomp = mysqli_query($link, $compmail);
                
                        if (!$resultmailcomp) {
                            http_response_code(500);
                            $response = array(
                                'responseid' => '0',
                                'description'=> 'Unexpected error, please, try again later'
                            );
                        }
                        else{
                            if(mysqli_num_rows($resultmailcomp) > 0){
                                $response[0] = array(
                                    'responseid' => '0',
                                    'description'=> 'Mail already exists, try another one'
                                );
                            }
                            else{
                                $sql = sprintf("INSERT INTO users(user, password, mail) VALUES ('%s', AES_ENCRYPT('%s', 'd83ncry7t'), '%s')", $username, $password, $email );                                    
                        }
                    }
                }
            }
        } 
    }
}
break;
default:
    $sql = null;
    break;
}
if(!$sql){
}
else{
// excecute SQL statement
$result = mysqli_query($link,$sql);
// Get number of rows, if its more than one then its an array and needs []
$numresult = mysqli_num_rows($result);

// die if SQL statement failed
if (!$result) {
http_response_code(500);
$response = array(
    'responseid' => '0',
    'description'=> 'Unexpected error, please, try again later'
);
}
else{
$response[0] = array(
    'responseid' => '1',
    'description'=> 'User has been created correctly, thank you for using Abstract!!'
);
}
}
echo json_encode($response);
// close mysql connection
mysqli_close($link);
}

function login($method, $request, $input, $table, $key){
// connect to the mysql database
//$link = mysqli_connect('localhost', 'root', 'root', 'abstractapitest');
$db = new MyDB(); 
$link = $db->getDB();
mysqli_set_charset($link,'utf8');

// escape the columns and values from the input object
$columns = preg_replace('/[^a-z0-9_]+/i','',array_keys($input));
$values = array_map(function ($value) use ($link) {
if ($value===null) return null;
return mysqli_real_escape_string($link,(string)$value);
},array_values($input));

// build the SET part of the SQL command
$set = '';
for ($i=0;$i<count($columns);$i++) {
$set.=($i>0?',':'').'`'.$columns[$i].'`=';
$set.=($values[$i]===null?'NULL':'"'.$values[$i].'"');
}

// create SQL based on HTTP method
switch ($method) {
case 'POST':  
    $sql = null;
    $username = $_POST['username'];
    $password = $_POST['password'];
    if (preg_match('/[\'^£$%&*()}{@#~?><>,|=+¬]/', $username)){
        header('Content-type: application/json');
        $response[0] = array(
            'responseid' => '0',
            'description'=> 'Username has special character, which is not permited',
            'token' => ''
        );
    }
    elseif(empty($username) == true){
        $response[0] = array(
            'responseid' => '0',
            'description'=> 'Username is empty, which is not permited',
            'token' => ''
        );
    }
    elseif(strlen($username) < 3){
        $response[0] = array(
            'responseid' => '0',
            'description'=> 'Username has to be at least 3 characters',
            'token' => ''
        );
    }
    else{
        //Check if password string has ' as a character
        if (preg_match('/[\']/', $password)){
            header('Content-type: application/json');
                $response[0] = array(
                    'responseid' => '0',
                    'description'=> 'Password has the simple quote as a character, which is not permited',
                    'token' => ''
                );
        }
        elseif(empty($password) == true){
            $response[0] = array(
                'responseid' => '0',
                'description'=> 'Password is empty, which is not permited',
                'token' => ''
            );
        } 
        elseif(strlen($password) < 8){
            $response[0] = array(
                'responseid' => '0',
                'description'=> 'Password has to have at least 8 characters',
                'token' => ''
            );

        
        }
        else{
            $sql = "SELECT * FROM users WHERE user ='".$username."' AND password=AES_ENCRYPT('".$password."', 'd83ncry7t');";
        } 
}
        break;
default:
    $sql = null;
    http_response_code(403);
    break;
}
//die("HOLI");
if(!$sql){

}
else{
// excecute SQL statement
$result = mysqli_query($link,$sql);
$rows = mysqli_fetch_assoc($result);
$userid = $rows["id"];
//$result->$numrows
$numrows = mysqli_num_rows($result);
//echo $numrows;
//die($numrows);
//echo("Numrows" + $numrows);
// die if SQL statement failed
if (!$result) {
http_response_code(400); 
$response[0] = array(
    'responseid' => '0',
    'description'=> 'Unexpected error, please, try again later',
    'token' => ''
);
}
else{
    if($numrows > 0){
        $sql2 = "UPDATE users set last_login=now() WHERE id=".$userid.";";
        $result2 = mysqli_query($link, $sql2);
        if(!$result2){
            $response[0] = array(
                'responseid' => '0',
                'description'=> 'Something went wrong with the database, please, try again',
                'token'=>''
            );
        }
        else{
        $sql3 = "SELECT id, user, last_login from users WHERE id=".$userid.";";
        $result3 = mysqli_query($link, $sql3);
        $row2 = mysqli_fetch_assoc($result3);
        //die($row2["last_login"]);
        $token = authencode($row2["id"], $row2["user"], $row2["last_login"]);
            $response[0] = array(
                'responseid' => '1',
                'description'=> 'User login succesful, thank you for using Abstract!!',
                'token'=>$token
            );
        }
}
else{
    $response[0] = array(
        'responseid' => '0',
        'description'=> 'Username or password are incorrect, please, try again',
        'token' => ''
);
}
}
} 
echo json_encode($response);
// close mysql connection
mysqli_close($link);
}

//Stream a song the same way you would with a public file
function testmp(){
    $file = "/var/www/songs/1/1/3.mp3";
    header("Content-type: audio/mpeg");
    header("Content-length: " . filesize($file));
    header("Cache-Control: no-cache");
    header("Content-Transfer-Encoding: binary"); 
    readfile($file);
}

//Test of image showing on browser
function testimage(){
    $file = "/var/www/avatars/default.png";
    header("Content-type: image/jpeg");
    header("Content-length: " . filesize($file));
    header("Cache-Control: no-cache");
    header("Content-Transfer-Encoding: binary"); 
    readfile($file);
}

function playsong($method, $request, $input, $table, $key){
// connect to the mysql database
$link = mysqli_connect('localhost', 'root', 'root', 'abstractapitest');
mysqli_set_charset($link,'utf8');


// escape the columns and values from the input object
$columns = preg_replace('/[^a-z0-9_]+/i','',array_keys($input));
$values = array_map(function ($value) use ($link) {
if ($value===null) return null;
return mysqli_real_escape_string($link,(string)$value);
},array_values($input));

// build the SET part of the SQL command
$set = '';
for ($i=0;$i<count($columns);$i++) {
$set.=($i>0?',':'').'`'.$columns[$i].'`=';
$set.=($values[$i]===null?'NULL':'"'.$values[$i].'"');
}

// create SQL based on HTTP method
switch ($method) {
case 'GET':  
    $sql = "select path from `songs`".(" WHERE id=$key"); break;
default:
    $sql = "";
    http_response_code(403);
    break;
}

// excecute SQL statement
$result = mysqli_query($link,$sql);

// Get number of rows, if its more than one then its an array and needs []
$numresult = mysqli_num_rows($result);

// die if SQL statement failed
if (!$result) {
http_response_code(404);
die(mysqli_error());
}
else{
    //    $result2 = mysqli_fetch_array($result);
    $row = mysqli_fetch_assoc($result);
    $songpath = $row['path'];
    $file = "/var/www/abstract/songs".$songpath;
    header("Content-type: audio/mpeg");
    header("Content-length: " . filesize($file));
    header("Cache-Control: no-cache");
    header("Content-Transfer-Encoding: binary"); 
    readfile($file);
 //   var_dump("holi"+$songpath);
}

// close mysql connection
mysqli_close($link);
}



function songinformation($method, $request, $input, $table, $key){
// connect to the mysql database
//$link = mysqli_connect('localhost', 'root', 'root', 'abstractapitest');
$db = new MyDB(); 
$link = $db->getDB();
mysqli_set_charset($link,'utf8');
$numresult = 0;

// escape the columns and values from the input object
$columns = preg_replace('/[^a-z0-9_]+/i','',array_keys($input));
$values = array_map(function ($value) use ($link) {
if ($value===null) return null;
return mysqli_real_escape_string($link,(string)$value);
},array_values($input));

// build the SET part of the SQL command
$set = '';
for ($i=0;$i<count($columns);$i++) {
$set.=($i>0?',':'').'`'.$columns[$i].'`=';
$set.=($values[$i]===null?'NULL':'"'.$values[$i].'"');
}

// create SQL based on HTTP method
switch ($method) {
case 'GET':
    if($key != 0){
        $sql = "SELECT artists.name as artist, albums.name as album, songs.name as song FROM songs INNER JOIN albums_songs ON songs.id = albums_songs.song_id 
            INNER JOIN albums ON albums_songs.album_id = albums.id 
            INNER JOIN albums_artists ON albums.id = albums_artists.album_id 
            INNER JOIN artists ON albums_artists.artist_id = artists.id".($key?" WHERE songs.id=$key":'');
    }
    else{
    $sql = "";
    }
    break;
default:
    $sql = "";
    break;
}


// excecute SQL statement
$result = mysqli_query($link,$sql);


// Get number of rows, if its more than one then its an array and needs []
$numresult = mysqli_num_rows($result);

// die if SQL statement failed
if (!$result) {
http_response_code(404);
die(mysqli_error());
}

// print results, insert id or affected row count
if ($method == 'GET') {
echo '[';
for ($i=0;$i<$numresult;$i++) {
echo ($i>0?',':'').json_encode(mysqli_fetch_object($result));
//var_dump($request, $key, $table, $columns, $values); 
}
echo ']';
} elseif ($method == 'POST') {
echo mysqli_insert_id($link);
} else {
echo mysqli_affected_rows($link);
}

// close mysql connection
mysqli_close($link);
}

function authdecode(){
    
$db = new MyDB(); 
$link = $db->getDB();
$key = "70K3N4btr4ct";                                                                                                          
$token = null;                                                                                                                  
$headers = apache_request_headers();                                                                                                
if(isset($headers['Authorization'])){                                                                                           
$jwt = $headers['Authorization'];                                                                                           
    try{                                                                                                                        
        $decoded = \Firebase\JWT\JWT::decode($jwt, $key, array('HS256'));                                                       
        $data= json_decode( json_encode($decoded), true); 
        $contador = 0;
        $user_id = 0;
        $username = "";
        $date = "";
        $contador = array_slice($data,0,   3);
        
        $user_id = $contador["userid"];
        $username = $contador["username"];
        $date = $contador["lastlogin"];

        $sql = "SELECT * FROM users where id=".$user_id.";" ;
        $result = mysqli_query($link, $sql);
        $row = mysqli_fetch_assoc($result);
        $lastlogin = $row["last_login"];
        if($lastlogin == $date){
        $response = array(
            'responseid' => '1',
            'description'=> 'Key matches, sending response'
        );
        }
        else{
        
        $response = array(
            'responseid' => '2',
            'description'=> 'Key date doesnt match'
        );
        
        
        }
        //$row = $result->fetch_assoc();
        //var_dump($row["user"]);
    }                                                                                                                           

    catch(\Firebase\JWT\SignatureInvalidException $e){                                                                          
        $response = array(
            'responseid' => '0',
            'description'=> 'Key doesent match'
        );
    }     

    catch(UnexpectedValueException $i){
        $response = array(
            'responseid' => '0',
            'description'=> 'Key is invalid'
        );
    }
    
    catch(DomainException $j){
        $response = array(
            'responseid' => '0',
            'description'=> 'Key cannot be berified in the domain, cannot send response'
        );
    }

    }
    else{
        $response = array(
            'responseid' => '0',
            'description'=> 'Key not sent, cannot send response'
        );
}

//var_dump($response);
//echo reset($response);
return $response;
}


function authencode($userid, $username, $lastlogin){
$key = "70K3N4btr4ct";                                                                                                          
$token = array(
    "userid" => $userid,
    "username" => $username,
    "lastlogin" => $lastlogin
);
    $jwt = \Firebase\JWT\JWT::encode($token, $key);
    return $jwt;
}

function subgenresbygenre($method, $request, $input, $table, $key){
$authresult = authdecode();
// connect to the mysql database
//$link = mysqli_connect('localhost', 'root', 'root', 'abstractapitest');
$db = new MyDB(); 
$link = $db->getDB();
mysqli_set_charset($link,'utf8');


// escape the columns and values from the input object
$columns = preg_replace('/[^a-z0-9_]+/i','',array_keys($input));
if($input == null){
    $values = [];
}
else{
$values = array_map(function ($value) use ($link) {
    if ($value===null) return null;
        return mysqli_real_escape_string($link,(string)$value);
},array_values($input));
}
// build the SET part of the SQL command
$set = '';
for ($i=0;$i<count($columns);$i++) {
$set.=($i>0?',':'').'`'.$columns[$i].'`=';
$set.=($values[$i]===null?'NULL':'"'.$values[$i].'"');
}

// create SQL based on HTTP method
switch ($method) {
case 'GET':  
    $sql = "select subgenres.* from subgenres inner join genres_subgenres on subgenres.id = genres_subgenres.subgenre_id
           INNER JOIN genres on  genres_subgenres.genre_id = genres.id".($key?" WHERE genres.id=$key":'');
    break;
default:
    $sql = "";
    http_response_code(403);
    break;
}

// excecute SQL statement
$result = mysqli_query($link,$sql);

// Get number of rows, if its more than one then its an array and needs []
$numresult = mysqli_num_rows($result);

// die if SQL statement failed
if (!$result) {
    http_response_code(404);
//die(mysqli_error());
}

// print results, insert id or affected row count
if ($method == 'GET') {

    //if ($numresult > 1) 
echo '[';
echo '['.json_encode($authresult).']';
//Add a comma to separate the auth array from the response array
echo ",";
echo '[';
for ($i=0;$i<$numresult;$i++) {
echo ($i>0?',':'').json_encode(mysqli_fetch_object($result));
//var_dump($request, $key, $table, $columns, $values); 
}
//if ($numresult > 1) 
echo ']';
echo ']';
} elseif ($method == 'POST') {
echo mysqli_insert_id($link);
} else {
    echo mysqli_affected_rows($link);
}

// close mysql connection
mysqli_close($link);
}

function albumsbysubgenre($method, $request, $input, $table, $key){
$authresult = authdecode();
// connect to the mysql database
$db = new MyDB(); 
$link = $db->getDB();
mysqli_set_charset($link,'utf8');


// escape the columns and values from the input object
$columns = preg_replace('/[^a-z0-9_]+/i','',array_keys($input));
if($input == null){
    $values = [];
}
else{
$values = array_map(function ($value) use ($link) {
    if ($value===null) return null;
        return mysqli_real_escape_string($link,(string)$value);
},array_values($input));
}
// build the SET part of the SQL command
$set = '';
for ($i=0;$i<count($columns);$i++) {
$set.=($i>0?',':'').'`'.$columns[$i].'`=';
$set.=($values[$i]===null?'NULL':'"'.$values[$i].'"');
}

// create SQL based on HTTP method
switch ($method) {
case 'GET':  
    $sql = "select albums.* from albums INNER JOIN subgenres_albums ON albums.id = subgenres_albums.album_id INNER JOIN 
            subgenres on subgenres_albums.subgenre_id = subgenres.id".($key?" WHERE subgenres.id=$key":'');
    break;
default:
    $sql = "";
    http_response_code(403);
    break;
}

// excecute SQL statement
$result = mysqli_query($link,$sql);

// Get number of rows, if its more than one then its an array and needs []
$numresult = mysqli_num_rows($result);

// die if SQL statement failed
if (!$result) {
    http_response_code(404);
//die(mysqli_error());
}

// print results, insert id or affected row count
if ($method == 'GET') {

    //if ($numresult > 1) 
echo '[';
echo '['.json_encode($authresult).']';
//Add a comma to separate the auth array from the response array
echo ",";
echo '[';
for ($i=0;$i<$numresult;$i++) {
echo ($i>0?',':'').json_encode(mysqli_fetch_object($result));
//var_dump($request, $key, $table, $columns, $values); 
}
//if ($numresult > 1) 
echo ']';
echo ']';
} elseif ($method == 'POST') {
echo mysqli_insert_id($link);
} else {
    echo mysqli_affected_rows($link);
}

// close mysql connection
mysqli_close($link);
}

//Show variable values 
//var_dump($request, $key, $table, $columns, $values); 
//die("im here");
