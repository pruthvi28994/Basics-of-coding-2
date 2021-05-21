<?php
    $year=$_POST['year'];
    function leapyear($year){
    if($year%400==0||($year%4==0 && $year%100!=0))
    {
        echo "<b>".$year." is a leap year</b>";
    }else
    {
        echo "<b>".$year." is not a leap year</b>";
    }
    }
    echo leapyear($year);
?>