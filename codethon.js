function validatefunction(){
         var count=0;
        const President=document.forms["myform"]["president"].value
        const Capital=document.forms["myform"]["capital"].value
        if((President=="" && Capital=="") || President=="" || Capital==""){
            alert("All Fields are must")
            return false
        }
        for(var i=0;i<President.length;i++){
            if(Capital[i].checked && President[i].checked){
                    if(Capital[i].value=="delhi" && President[i].value=="Rajendra Prasad"){
                            count=2;
                    }else if(Capital[i].value=="delhi" && President[i].value!="Rajendra Prasad"){
                            count=1;
                    }else if(President[i].value=="Rajendra Prasad" && Capital[i].value!="delhi"){
                            count=1;
                    }
            }
         }
         document.write(count)
}
