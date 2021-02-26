<?php
session_start();
// die;
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);
require_once('InslyTaxCalculator.php');

$user_name = $_POST['user_name'];
$car_price =  $_POST['price_field'];
$installments =  $_POST['installments'];
$tax_field =  $_POST['tax_field'];

// echo '<pre>';

// print_r($_POST);

// die;



// a new rps object
$calculateTax = new InslyTaxCalculator($user_name,$car_price,$tax_field,$installments);


$calculateTax->calculateBasePremium(); // checking who won the game

$calculateTax->calculateComission(); // checking who won the game
$calculateTax->calculateTax(); // checking who won the game
$calculateTax->calculateCost(); // checking who won the game
// echo $calculateTax->printResult(); // checking who won the game



// die;
//storing the result in the session 
$_SESSION['user_name'] = $calculateTax->userName;
$_SESSION['result'] = $calculateTax->printResult();
// $rps->print_result();

//returning to the previous page to show the final result
header("Location: index.php");


