// just prints in console
console.log("hellow world ! using javascript")
// in order to print in html page
document.write("hello world using java script")

// undefined for default variable
var genral
console.log(typeof(genral))

//type of variable based on the initiallization
var name="pruthvi";
console.log(typeof(name))
var num=123;
console.log(typeof(num))

//array stored in the form of object
var array=[1,2,3,4,45,5,6]
console.log(typeof(array))
var string=new Array("pru","prav","kir","khal","bhavani","jayanth","sachin")
console.log(typeof(string))
// accesing array elements
console.log(array[0]+" "+string[0])
// length
console.log(array.length+" "+string.length)
var i=0;
// printing the array elements
for(i=0;i<array.length;i++)
{
        console.log(array[i]+" "+string[i])
        // printing in the html page
        document.write(array[i]+" "+string[i]+"<br/>")
}


//type conversion
var num1=5;
var num2=num1+5;
var num3=num1+"5"  //gets converted to the string.based on the values added type will get converted
console.log(num3) 

//prompt is something that allows you write

var prompt_value=prompt("enter name of the person")
console.log(typeof(prompt_value)) //default would be string
// inorder to manupulated the prompt value
// make use of parseInt to convert to integer
document.write(parseInt(prompt_value)+num1+"<br/>")

// alter is used to give alert message
alert("thanks for entering number")

// concat of string can be used by using +
document.write("hello "+name+"<br/>")