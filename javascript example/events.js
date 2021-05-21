// listener for the id click

function userdefinedclicked(){
    document.getElementById("one").setAttribute("style","color:blue")
}
document.getElementById("one").addEventListener("click",userdefinedclicked)

//mouse over

function userdefinedmouseover(){
        document.getElementById("one").setAttribute("style","color:yellow")
}
document.getElementById("one").addEventListener("mouseover",userdefinedmouseover)

//mouse leave
function userdefinedmouseleave(){
    document.getElementById("one").setAttribute("style","font-size: larger")
}
document.getElementById("one").addEventListener("mouseleave",userdefinedmouseleave)