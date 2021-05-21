function validatefunction(){
    const names=document.getElementById("name")
    const phn=document.getElementById("phno")
    if(names.value == "" || phn.value == "")
    {
        alert("all fields are must")
        return false;
    }

    //checking wthere phno is number or nt
    // if(isNaN(phn))
    // {
    //     alert("phno must be number")
    // }
}

function gretting(){
    document.getElementById("result").innerHTML="Thank you for giving your input"
}

