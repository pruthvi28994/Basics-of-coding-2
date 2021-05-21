// conditonal if
var a=parseInt(prompt("Enter variable 1"))
var b=parseInt(prompt("Enter variable 2"))
document.write("finding greater number</br>")
if(a>b)
    document.write(a+" is greater than "+b+"<br/>")
else if(a==b)
    document.write(a+" is equal to "+b+"<br/>")
else 
    document.write(b+" is greater than "+a+"<br/>");

// using ternary operator
// document.write("using ternary operator<br/>")
// (a>b)?document.write(a+" is greater than "+b+"<br/>"):document.write(b+" is greater than "+a+"<br/>")
// conditonal AND  and OR
// leap year
var year=parseInt(prompt("Enter the year"))
if(year%4==0 ||(year%400==0 && year%100!=0))
    document.write(year+" is leap year <br/>")
else
    document.write(year+" is not a leap year <br/>")

// for loops 
var names=["pruthvi","praveen","kiran","khalandar","jayanth"]
var marks=new Array()
for(var i=0;i<names.length;i++){
       marks[i]=parseInt(prompt("Enter the Marks of student:"+names[i]))
}
var msg=""
for(var i=0;i<names.length;i++){
       msg+=names[i]+" marks=>"+marks[i]+"\n"
}
alert(msg)
//  switch 
var book=prompt("Enter the book genre")
switch(book)
{
    case "history":document.write("you like history book <br/>")
                    break;
    case "economics":document.write("you like economic books <br/>")
                    break;
    case "geographic":document.write("you like geographic book <br/>")
                    break;
    case "political":document.write("you like polictics <br/>")
                    break;
    default:document.write("yo have not selected any books")
}

// while looopss
var i=0,sum=0;
while(i<names.length)
 {
     document.write(names[i]+" marks=>"+marks[i]+"<br/>")
     sum+=marks[i];
     i++;
 }
 document.write("overall sum of the marks:"+sum)