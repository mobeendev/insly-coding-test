<?php
 /**
  * @author Abdul Mobeen
  * @author  <mobeendev@gmail.com>
  */
 class InslyTaxCalculator
 {
 	public $basePrice = '';
 	public $robot_choice = '';
 	public $user_name = '';

 	public $user_wins = false;
 	public $robot_wins = false;
 	public $draw= false;
 	public $msg= false;

 	public function __construct($user_name,$user_choice,$robot_choice) {
 		$this->user_name = $user_name;
 		$this->user_choice = $user_choice;
 		$this->robot_choice = $robot_choice;
 	}


     /**
     * Game Rules
     * Below are the general setting for the real life scenarios
	 * 1 is for Rock
     * 2 is for Siccor
     * 3 is for Paper
     * @method check_result
   	 * The purpose of this method is to calculate who will win based on the selection
     * @param null
     *
     */

     public function check_result()
     {

     	if($this->user_choice  == $this->robot_choice){
     		$this->draw = true; 
     	}else if($this->user_choice == 1){
     		if($this->robot_choice == 2){
     			$this->draw = false;
     			$this->user_wins = true;
     			$this->robot_wins = false;
     		}else{
     			$this->draw = false;
     			$this->user_wins = false;
     			$this->robot_wins = true;
     		}

     	}
     	else if($this->user_choice == 2){
     		if($this->robot_choice == 3){
     			$this->draw = false;
     			$this->user_wins = true;
     			$this->robot_wins = false;
     		}else{
     			$this->draw = false;
     			$this->user_wins = false;
     			$this->robot_wins = true;
     		}

     	}
     	else if($this->user_choice == 3){
     		if($this->robot_choice == 1){
     			$this->draw = false;
     			$this->user_wins = true;
     			$this->robot_wins = false;
     		}else{
     			$this->draw = false;
     			$this->user_wins = false;
     			$this->robot_wins = true;
     		}

     	}


     }

     /**
     * @method print_result
   	 * The purpose of this method is to output the result
     * @param null
     * @return string  
     */

     public function print_result()
     {
     	$this->user_name  = ucwords((strtolower($this->user_name)));

     	$msg = '<b>'. $this->user_name . '</b> selected: '.   $this->get_selected_objected($this->user_choice) . ' <br>
         <b>Robot </b> selected:' . 
     	$this->get_selected_objected($this->robot_choice)  . '. <br>';

     	if($this->user_wins){
     		$msg .=  '<b>'. $this->user_name . '</b> win the game. <br>' ;
     	}

     	if($this->robot_wins){
     		$msg .=   ' Robot win the game. <br>' ;
     	}

     	if($this->draw){
     		$msg .=   ' Its a draw <br>' ;
     	}

     	return $msg;
     }

   /**
     * @method get_selected_objected
   	 * The purpose of this method is identify the selected object/item 
     * @param $choice
     *
     * @return mixed
     */
   private function get_selected_objected($choice){


   	$config = [
   		"1" => "Rock",
   		"2" => "Siccor",
   		"3" => "Paper"
   	];
   	if (array_key_exists($choice, $config)) {
   		return $config[$choice];
   	}
   	return null;
   }
}