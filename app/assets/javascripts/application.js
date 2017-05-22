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

var current = mercadeo

var mercadeo = [["Direccion de Ingreso, Consumo Fidel y Reten", "Gerencia de Retención y Fidelización","Gerencia General de Maximización de Ingresos y Consumo - Ingresos Masivos",
                  "Gerencia General de Maximización de Ingresos y Consumo - Consumo","Gerencia Gestión de Ingresos"],
                ["Gerencia General Planificación y Administración"],
                ["Gerencia General Inteligencia de Negocios", "Gerencia Ingeniería del Dato",
                  "Gerencia Conocimiento del cliente"],
                ["Gerencia Experiencia del Cliente"],
                ["Gerencia General Movistar TV","Gerencia Comercial Movistar TV","Gerencia Atención multicanal Movistar TV"],
                ["Gerencia General Captación","Gerencia de Certificación y operaciones","Gerencia de Oferta comercial"],
                ["Gerencia General de Publicidad y medios","Gerencia de Publicidad","Gerencia de Eventos","Gerencia de Patrocinios","Gerencia de Medios"]]

var perc = [["Gerencia General Planificación, Org. Y Compens.","1","2","3"],["Gerencia General Desarrollo, Organiz y Talento","2","3","4"],
            ["Gerencia General Experiencia al Empleado","3","4","5"]]    

var rrhh = [["Gerencia General Planificación, Org. Y Compens.","1","2","3"],["Gerencia General Desarrollo, Organiz y Talento","2","3","4"],
            ["Gerencia General Experiencia al Empleado","3","4","5"]] 

var ggft = [["Gerencia General Planificación, Org. Y Compens.","1","2","3"],["Gerencia General Desarrollo, Organiz y Talento","2","3","4"],
            ["Gerencia General Experiencia al Empleado","3","4","5"]] 

var tech = [["Gerencia General Planificación, Org. Y Compens.","1","2","3"],["Gerencia General Desarrollo, Organiz y Talento","2","3","4"],
            ["Gerencia General Experiencia al Empleado","3","4","5"]] 

var sc = [["Gerencia General Planificación, Org. Y Compens.","1","2","3"],["Gerencia General Desarrollo, Organiz y Talento","2","3","4"],
            ["Gerencia General Experiencia al Empleado","3","4","5"]] 

var drig = [["Gerencia General Planificación, Org. Y Compens.","1","2","3"],["Gerencia General Desarrollo, Organiz y Talento","2","3","4"],
            ["Gerencia General Experiencia al Empleado","3","4","5"]]    

var dsf = [["Gerencia General Planificación, Org. Y Compens.","1","2","3"],["Gerencia General Desarrollo, Organiz y Talento","2","3","4"],
            ["Gerencia General Experiencia al Empleado","3","4","5"]] 

var da = [["Gerencia General Planificación, Org. Y Compens.","1","2","3"],["Gerencia General Desarrollo, Organiz y Talento","2","3","4"],
            ["Gerencia General Experiencia al Empleado","3","4","5"]] 

var emp = [["Gerencia General Planificación, Org. Y Compens.","1","2","3"],["Gerencia General Desarrollo, Organiz y Talento","2","3","4"],
            ["Gerencia General Experiencia al Empleado","3","4","5"]] 

var fcg = [["Gerencia General Planificación, Org. Y Compens.","1","2","3"],["Gerencia General Desarrollo, Organiz y Talento","2","3","4"],
            ["Gerencia General Experiencia al Empleado","3","4","5"]] 

var canales = [["Gerencia General Planificación, Org. Y Compens.","1","2","3"],["Gerencia General Desarrollo, Organiz y Talento","2","3","4"],
            ["Gerencia General Experiencia al Empleado","3","4","5"]] 
          

function alert(element){
    if (element.value == "VP MERCADEO"){
        $("#ggs").empty();
        var blank = document.createElement("option");
            blank.text = " ";
            blank.value = " ";
            $("#ggs").append(blank);
        current = mercadeo
        for( var i = 0; i < mercadeo.length ; i++){

            var option = document.createElement("option");
            option.text = mercadeo[i][0];
            option.value = mercadeo[i][0];
            $("#ggs").append(option);
        }
    }else{
        $("#ggs").empty();
        var blank = document.createElement("option");
            blank.text = " ";
            blank.value = " ";
            $("#ggs").append(blank);
        current = rrhh
        for( var i = 0; i < rrhh.length ; i++){
            var option = document.createElement("option");
            option.text = rrhh[i][0];
            option.value = rrhh[i][0];
            $("#ggs").append(option);
        }
    } 
    
}

function alert2(element){
    gg = []
    for(var i=0;i < current.length;i++){
        if (element.value == current[i][0]){
            gg = current[i];
            i = current.length;
        }
    }
    $("#gerencias").empty();
        for( var i = 1; i < gg.length ; i++){
            var option = document.createElement("option");
            option.text = gg[i];
            option.value = gg[i];
            $("#gerencias").append(option);
        }

}