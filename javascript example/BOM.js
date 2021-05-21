//browser object model
function windowsprompt(){
        var newwindow=window.open("http://www.google.com","newWindow using BOM","width=200px,height=200px")
        newwindow.moveTo(200,100)
        alert("screen width:"+screen.width+" screen height:"+screen.height)
        newwindow.close ()
}
// navigator 
function navigatorprompt(){
      alert(navigator.appName+"\n"+navigator.cookieEnabled+"\n"+navigator.userAgent+"\n"+navigator.appCodeName+"\n"+navigator.product)
}
// location
function locationprompt(){
       document.write("href location:"+location.href+"<br/>")
       document.write("local host:"+location.host+"<br/>")
       document.write("protocol :"+location.protocol+"<br/>")
    // alert("assignment protocaol for perticular location i.e google"+location.assign("http://www.google.com"))
}
// locationprompt()

// history
function historyprompt(){
        document.write("history of web:"+history.length)
        document.write(history.scrollRestoration)
}
historyprompt()