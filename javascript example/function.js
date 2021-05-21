// // function is of 4 types
// 1named function
// 2anonymous function
// 3self invoking function
// 4 constructor

// 1.named function 
        // similar to that of normal function
        // consist of name 
        // can be called multiple times
function add(num1,num2){
    return a+b
}
var a=parseInt(prompt("enter the variable 1:"))
var b=parseInt(prompt("enter the variable 2:"))
console.log(add(a,b))  //prints in console
document.write("named functions :"+add(a,b))

// 2.anonymous function
        // does not have name
        // cannot call multiple times and called immediatly after it is loaded
var add=function(num1,num2){  
    document.write("Anonymous function is called <br/>") 
    console.log("Anonymous function is called")
    return num1+num2
 };
 console.log(add(a,b));
 setTimeout(add(a,b),5000) //pauses for 5000 secs and calls the functions

 //3.constructor
        // constructor is called when an object is created
        // ?new key word is used 
        // will everything in the function as parameter
var add=new Function("num1","num2","console.log('Constructor funtion is called');return num1+num2")
console.log(add(a,b))
// 4.self invoking function
(function(num1,num2){
     document.write("Self Invoking Function is called <br/>"+(num1+num2));
 }(a,b));