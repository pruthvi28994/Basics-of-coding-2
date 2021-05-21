<html>
  <body>
        <form action="fibonaciinumber.php" method="post">
		    Enter the nth fibonacii number:<input type="number" name="number" required><span style="color:red">*</span>
			<input type="submit"/>
		</form>
		<?php 
		      $num=$_POST['number'];
		      function fibonaci($num)
			  {
				  if($num==0 || $num==1)
				  { 
			         return $num;
				  }
				 return fibonaci($num-1)+fibonaci($num-2);
				   
			   
			  }
			echo fibonaci($num);
		?>
		
    </body>
</html>
