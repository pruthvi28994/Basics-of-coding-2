// document object model
// html dom is standard object model and programinig interface for html
    // it defines
            // 1 html elements as objects
            // 2 properties of all html elements
            // 3 events of all html elements
            // 4 method to access all html elements

// ex 1.getElementById() 2.getElementBYClassName() 3.getElementByTagName()

// 1.getElementByID
console.log(document.getElementById("one"))
// 2.getElementBYClassName()
alert(document.getElementsByClassName("1"))
// 3.getElementByTagName()
console.log(document.getElementsByTagName("input"))



// changing the attributes change styling
document.getElementById("one").setAttribute("style","color:green")
