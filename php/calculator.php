<html>
   <head><title>Calculater</title></head>
    <body>
               <form action="cal.php" method="post">
                  <table cellspacing="2px" cellpadding="4px" border="15" align="center">
                   <tr><td><center>Calculator</center></td></tr>
                   <tr><td>Enter The Number 1:<input type="number" name="number1" required><span style="color:red">*</span></td></tr>
                   <tr><td>Enter The Number 2:<input type="number" name="number2" required><span style="color:red">*</span></td></tr>
				   <tr><td>
                           <input type="radio" name="cal" value="sum"/>sum<br/>
                           <input type="radio" name="cal" value="multiply"/>multiply<br/>
                           <input type="radio" name="cal" value="division"/>divide<br/>
                           <input type="radio" name="cal" value="mod"/>mod<br/>
                           <input type="radio" name="cal" value="subtract"/>subtract<br/>
                   </td></tr>
                   <tr><td><center><button type="submit" value="submit">Submit</button>
                   <button type="reset" value="reset">Reset</button></center></td></tr>
               </table>
            </form>
    </body>
 </html>
                        