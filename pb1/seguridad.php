<?php
    session_start(); 
    if (!isset($_SESSION["correo"]))
        header("Location: index.html");
?>