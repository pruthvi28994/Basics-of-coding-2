// simple creating a object 
// 1
var person = new Object()
person.name="pruthvi"
person.age=21
console.log(person.name+" "+typeof(person.name))
console.log(person.age)

// lets create a function for inititing var
function classobject() {
    var obj=new Object();
    obj.first_name="pruthvi"
    obj.second_name="sagar"
    obj.phn=9591343294
    obj.address="RMS Colony"
    return obj
}
var obj_val=classobject();  //copyingobj reference
// other way of adding attributes
// 2
var person={
    name:"pruthvi",
    phn:9591343294,
    address:"rms colony"
}
// 3
var person1={}
person1['first_name']="namratha"
person1['phn']=9591343294
// 4
// object creation
    // creating object with cnstructer function
function Person() {
    this.first_name="Namaratha_pruthvi"
    this.desig="computer_science"
    this.age=21;
}
// creating object forconstructer
var proper=""
obj_val=new Person();

delete obj_val.age //deleting the properties
for(var p in obj_val)
    {
        proper+=p+","
    }
alert("printing properties using for ="+proper)



// 5
// by making use create method
var Animal={
        type:"Invertibrates",
        displaytype:function () {
            alert("type is:"+this.type)
        }
}
var horse=Object.create(Animal)
horse.displaytype(); //calls the function

