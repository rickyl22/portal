// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
// require_tree .

$(document).ready(function(){
    $("#hola").click(function(){
        $("#button")[0].disabled = false;
    });

    $(".hola").click(function(){
        $("#button")[0].disabled = true;
        $("#button")[0].value = null;
    });
	
	$("#addNewChoice").click(function() {
		$("#poll_choices").append($("#new_choice_form").html())
		}
    );

});

function remove(element){
    element.parentNode.parentNode.removeChild(element.parentNode);
}



var mercadeo = ["Direccion de Ingreso, Consumo Fidel y Reten","Gerencia General Planificación y Administración",
                "Gerencia General Inteligencia de Negocios","Gerencia Experiencia del Cliente","Gerencia General Movistar TV",
                "Gerencia General Captación","Gerencia General de Publicidad y medios"]

var rrhh = ["Gerencia General Planificación, Org. Y Compens.","Gerencia General Desarrollo, Organiz y Talento",
            "Gerencia General Experiencia al Empleado"]                

function alert(element){
    if (element.value == "VP MERCADEO"){
        $("#ggs").empty();
        for( var i = 0; i < mercadeo.length ; i++){

            var option = document.createElement("option");
            option.text = mercadeo[i];
            option.value = mercadeo[i];
            $("#ggs").append(option);
        }
    }else{
        $("#ggs").empty();
        for( var i = 0; i < rrhh.length ; i++){
            var option = document.createElement("option");
            option.text = rrhh[i];
            option.value = rrhh[i];
            $("#ggs").append(option);
        }
    } 

/*
    $("#areas")[0].disabled = false; 
    $("#areas").empty();
    var option2 = document.createElement("option");
    option2.text = " ";
    option2.value = " ";
    $("#areas")[0].append(option2)
    var option = document.createElement("option");
    option.text = element.value;
    option.value = element.value;
    $("#areas")[0].append(option)*/
    
}