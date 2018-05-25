<?php
class MyDB
{
    var $db;

    public function __construct()
    {
        $this->db = mysqli_connect('localhost', 'root', 'root', 'abstractapitest');   
    } 

    public function getDB(){
        return $this->db;
    }



}
