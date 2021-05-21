// calculator functions
document.write("calculaor operation <br/>")
var num1=parseInt(prompt("enter the number 1"))
var num2=parseInt(prompt("enter the number 2"))
// +,/,*,-,%,++,--
// addtion of 2 numbers
document.write("addtion of two number:"+(num1+num2)+"<br/>")
document.write("subtraction two number:"+(num1-num2)+"<br/>")
document.write("multiplication of two numbers:"+(num1*num2)+"<br/>")
document.write("division of two numbers:"+(num1/num2)+"<br/>")
document.write("mod of two munbers:"+(num1%num2)+"<br/>")
document.write("increment:"+(num1++)+"<br/>")
document.write("decrement:"+(num1--)+"<br/>")
document.write("<br/>")

//assigment operator
var sum=0;
sum+=num1
document.write("sum of 2 number by assigment operators"+sum)