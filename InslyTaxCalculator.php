<?php
 /**
  * @author Abdul Mobeen
  * @author  <mobeendev@gmail.com>
  */
 class InslyTaxCalculator
 {
 	public $carPrice = 0;
 	public $basePrimium = 0;
  public $basePrimiumPercentage = 0;
 	public $userName = '';

 	public $commision = 0;
 	public $taxPercentage =0;
 	public $totalCost= 0;
 	public $installments= 0;
  public $taxAmount =0;

 	public function __construct($userName,$carPrice,$taxPercentage,$installments) {
 		$this->userName = $userName;
 		$this->carPrice = $carPrice;
 		$this->taxPercentage = $taxPercentage;
    $this->installments = $installments;
    $this->getBasePrimiumRate();
 	}

     /**
     * calculate base premium
     */

     public function calculateBasePremium()
     {

        $this->basePrimium = $this->basePrimiumPercentage/100* $this->carPrice ;

     }

      /**
     * calculate comission
     */

     public function calculateComission()
     {
        $this->commision = 17/100* $this->basePrimium ;
        
     }


      /**
     * calculate tax
     */

     public function calculateTax()
     {
        $this->taxAmount = $this->taxPercentage / 100 * $this->basePrimium ;
        
     }
     /**
     * calculate cost 
     */

     public function calculateCost()
     {

             $this->totalCost = $this->basePrimium +  $this->commision  +  $this->taxAmount;

     }

     /**
     * @method printResult
   	 * The purpose of this method is to output the final result
     * @param null
     * @return string  
     */

     public function printResult()
     {
     	$this->userName  = ucwords((strtolower($this->userName)));

     	// $msg = '<b>'. $this->user_name . '</b> selected: '.   $this->get_selected_objected($this->user_choice) . ' <br>
      //    <b>Robot </b> selected:' . 
      $msg = 'Hi, <b>'   . $this->userName . '</b> from Inslay Insurance.';
      $msg .= '<br>Today is ' .date('d-m-Y H:i:s') . '<br><br>' ;
      $msg .= 'Your Car Tax summary is provided below. <br>' ;
  
      $msg .=    'Applied Base Premium %: ' . $this->basePrimiumPercentage .' <br>';

        $msg .= '</b>  Calculated Base premium : ' . round($this->basePrimium,2) . '<br>';

        $msg .= '</b> Comission: ' . round($this->commision,2) . '<br>';

        $msg .= '</b> Tax Amount: ' . round($this->taxAmount,2) . ' <br>';

        $msg .= '</b> Calculated Total Cost: ' . round($this->totalCost,2) . '<br>';


     	return $msg;
     }

      public function getTabularRecord()
      {
  

  $table =  '<br>
  <b>With Installments the summary is provided below</b></br>
  <table border=1><tr><th>Installment Plan</th><th>Base Premiun</th><th>Comission</th><th>Tax Amount</th></tr>';

        $installment = 1;
        for ($counter=0; $counter <  $this->installments ; $counter ++) { 
    
  $table .=   "<tr>";
          $table .=  "<td>Installments # ". ($installment++) ."</td><td>" . round($this->basePrimium /  $this->installments,2). "</td><td>" . round($this->commision /  $this->installments,2)."</td><td>".round($this->taxAmount /  $this->installments,2)."</td>";
            $table .=  "<tr>";
        }

        if ($this->installments > 1) {
        $table .=   "<tr>";
          $table .=  "<td><b>Total Cost</b></td><td>" . round($this->basePrimium ). "</td><td>" . round($this->commision)."</td><td>".round($this->taxAmount)."</td>";
            $table .=  "<tr>";
      }

      $table .=  '</table>';
    
  return $table;
  
      }

   /**
     * @method getBasePrimiumRate
   	 * The purpose of this method is to calculate the base premium percentage 
     * @return integer
     */
   private function getBasePrimiumRate(){
      // if day is 5th day of the week i.e Friday AND
      // if hourr is between 15 and 20. as soon as time hits 20 or 8 PM, the rate is changed
     if(date('N') == 5 && date('G') >= 15 && date('G') <= 19  ) 
     {
        $this->basePrimiumPercentage = 13;

     }else{

        $this->basePrimiumPercentage = 11;
     }

   }


}