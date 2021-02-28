<?php
session_start();
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);
require_once('InslyTaxCalculator.php');

$user_name = $_POST['user_name'];
$car_price =  $_POST['price_field'];
$installments =  $_POST['installments'];
$tax_field =  $_POST['tax_field'];



// a new InslyTaxCalculator object
$calculateTax = new InslyTaxCalculator($user_name,$car_price,$tax_field,$installments);


$calculateTax->calculateBasePremium(); //setting the base premium

$calculateTax->calculateComission(); //calculaiting comission
$calculateTax->calculateTax(); //setting Tax
$calculateTax->calculateCost(); //calculating the total cost

// echo $calculateTax->printResult(); 



// die;
//storing the result in the session 
$_SESSION['user_name'] = $calculateTax->userName;
$_SESSION['result'] = $calculateTax->printResult();
$_SESSION['table'] = $calculateTax->getTabularRecord();
$_SESSION['installments'] = $installments;
$_SESSION['table'] =$calculateTax->getTabularRecord();
// $calculateTax->getTabularRecord();

//returning to the previous page to show the final result
header("Location: index.php");


