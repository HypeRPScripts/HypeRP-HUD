



$(document).ready(function() {
    window.addEventListener('message', function(event) {
        var data = event.data;
        $(".container").css("display",data.show? "none":"block");
    
        $("#boxHeal").css("width",data.health + "%");
        $("#boxArmor").css("width",data.armor + "%");
        $("#boxOxygen").css("width",data.oxygen + "%");
        $("#boxOxy").css("width",data.oxy + "%");
      


     if (water == true){
      document.getElementById("boxOxy").style.visibility = "visible";
     }else{
         document.getElementById("boxOxy").style.visibility = "hidden";
     }
       
        

       
        
        if (event.data.action == "updateStatus") {
            updateStatus(event.data.st);
            
        }
    })
})


$(function(){

    window.addEventListener('message', function(event){
        var item = event.data;
        $("#grade").text(item.job_grade);
        $("#name").text(item.job);
        $("#cash").text(item.cash);
        $("#ID").text(item.id);
       
        
})

});




function updateStatus(status){


    $('#boxHunger').css('width', status[0].percent+'%')
    $('#boxThirst').css('width', status[1].percent+'%')
   
}




