<?php
 $ch=$_POST['cal'];
 $sum=$mul=$div=$mod=$sub=0;
 function calculate()
   {
       $num1=$_POST['number1'];
       $num2=$_POST['number2'];
      switch($_POST["cal"])
          {
             case "sum":echo "<b>SUM of two numbers is =";
                        $sum=$num1+$num2;
						return $sum;
						break;
             case "multiply":echo "<b>mutliplication of two numbers is =";
                        $mul=$num1*$num2;
						return $mul;
						break;
             case "division":echo "<b>division of two numbers is =";
                        $div=$num1/$num2;
						return $div;
						break;
             case "mod":echo "<b>MODof two numbers is =";
                        $mod=$num1%$num2;
						return $mod;
						break;
             case "subtract":echo "<b>Subtraction of two numbers is =";
                        $sub=$num1-$num2;
						return $sub;
						break;
             default :echo "INvalid Option";
                       
           }
    }
     echo "<b>".calculate();
?>
<br/><b><a href="calculator.php">Back</a><b/>