<?php
session_start();

require_once('rps.php');

$user_selected = $_POST['user_choice'];
$user_name =  $_POST['user_name'];;

$robot_selected = rand(1,3); // robot or computer selection


// a new rps object
$rps = new RPS($user_name,$user_selected,$robot_selected);
$rps->check_result(); // checking who won the game


//storing the result in the session 
$_SESSION['user_name'] = $rps->user_name;
$_SESSION['user_selected'] = $user_selected;
$_SESSION['robot_selected'] = $robot_selected;
$_SESSION['result_calculated'] = true;
$_SESSION['result'] = $rps->print_result();
// $rps->print_result();

//returning to the previous page to show the final result
header("Location: index.php");


