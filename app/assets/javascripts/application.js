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

var mercadeo = [["Direccion de Ingreso, Consumo Fidel y Reten", "Gerencia de Retención y Fidelización","Gerencia General de Maximización de Ingresos y Consumo - Ingresos Masivos","Gerencia General de Maximización de Ingresos y Consumo - Consumo","Gerencia Gestión de Ingresos"],
                ["Gerencia General Planificación y Administración"],
                ["Gerencia General Inteligencia de Negocios", "Gerencia Ingeniería del Dato","Gerencia Conocimiento del cliente"],
                ["Gerencia Experiencia del Cliente"],
                ["Gerencia General Movistar TV","Gerencia Comercial Movistar TV","Gerencia Atención multicanal Movistar TV"],
                ["Gerencia General Captación","Gerencia de Certificación y operaciones","Gerencia de Oferta comercial"],
                ["Gerencia General de Publicidad y medios","Gerencia de Publicidad","Gerencia de Eventos","Gerencia de Patrocinios","Gerencia de Medios"]
                ]

var perc = [["Gerencia General Asuntos Regulatorios","Gerencia Seguimiento de Regulatorio","Gerencia Procesos y auditorias regulatorias"],
            ["Dirección Planificación, Estrategia y Precios","Gerencia de Proyectos Estratégicos","Gerencia Estrategia de Precios","Gerencia Planificación Estratégico"], 
            ["Dirección de Interconexión y Neg. Mayorista","Gerencia de Mediciones","Gerencia de gestión estratégica de Interc.","Gerencia de Negocios Nacionales","Gerencia de Negocios Internacionales","Gerencia de Negocio Mayorista","Gerencia de Soporte Técnico"],
            ["Dirección de Transf. Canales Virt y Telef.","Gerencia de Operaciones de Canales Virtuales","Gerencia General Desarrollo de productos Digitales - Desarrollo de Productos","Gerencia General Desarrollo de productos Digitales - Innovación","Gerencia General de Procesos Digitales - Portafolio y proyectos Estratégicos","Gerencia General de Procesos Digitales - Control y Aserguramiento","Gerencia General de Procesos Digitales - Proyectos y procesos transformacionales"] 
            ]    

var rrhh = [["Gerencia General Planificación, Org. Y Compens.","Gerencia Comp. Direct. Planif y Org.","Gerencia Compensación y Admón personal"],
            ["Gerencia General Desarrollo, Organiz y Talento","Gerencia Nómina y beneficio al personal","Gerencia de Gestión y talento al desarrollo"],
            ["Gerencia General Experiencia al Empleado"]
            ] 

var ggft = [["Gerencia de Inversión Social"]] 

var tech = [["Dirección de Redes","Gerencia de Redes","Gerencia General de Soporte - Redes","Gerencia General de Infraestructura y Aplicativo - Redes"],
            ["Dirección de TI","Gerencia General Desarrollo. Sistem. Produc. Serv - Plataformas TI","Gerencia General Desarrollo. Sistem. Produc. Ser - Sistemas de Soporte a la Operación","Gerencia General Desarrollo. Sistem. Produc. Serv - Configuración planes y promociones","Gerencia General Desarrollo. Sistem. Produc. Serv - Sistema Soporte al Neg.",
              "Gerencia Sist. De Inter con el cliente","Gerencia Servicio al cliente Interno","Gerencia General Ingeniería de Infraestructura - Dis y Desp de Plataformas TI","Gerencia General Ingeniería de Infraestructura - Planificación e Ing TI",
              "Gerencia de Integración de Servicios",
              "Gerencia General de Gestión de la Demanda - Demanda de Procesos Comerciales","Gerencia General de Gestión de la Demanda - Demanda Planif. Y Transf Digital","Gerencia General de Gestión de la Demanda - Gerencia Demanda de Soporte a la Operación","Gerencia General de Gestión de la Demanda - Demanda Gestión Clientes Corporativos","Gerencia General de Gestión de la Demanda - Pruebas y certificación",
              "Gerencia de Soporte de Aplicaciones",
              "Gerencia General Estrat. Arqu. Y Aseg. Soluc TI - Sistemas Gestión Empresarial","Gerencia General Estrat. Arqu. Y Aseg. Soluc TI - Gestión de Datos e Información","Gerencia General Estrat. Arqu. Y Aseg. Soluc TI - Calidad Planif y Seg. Soluc","Gerencia General Estrat. Arqu. Y Aseg. Soluc TI - Soporte Técnico SAP" ,"Gerencia General Estrat. Arqu. Y Aseg. Soluc TI - Procesos de Gestión Empresarial","Gerencia General Estrat. Arqu. Y Aseg. Soluc TI - Arquitectura de Soluciones",
              "Gerencia de Gestión de Datos",
              "Gerencia General Operaciones TI - Supervisión de servicios","Gerencia General Operaciones TI - Soporte funcional","Gerencia General Operaciones TI - Operación de procesos tecnológicos","Gerencia General Operaciones TI - Administración de Plataformas"],
            ["Gerencia General de Gestión y Gobernabilidad","Gerencia de Gestión Económica y Gobernabilidad","Gerencia de Planificación presupuestaria"],              
            ["Dirección de Planificación y Desarrollo de Red","Gerencia General de Ingeniería de Red - Red, Datos y Transporte","Gerencia General de Ingeniería de Red - Ingeniería Acceso Radio","Gerencia General de Ingeniería de Red - Desempeño","Gerencia General de Ingeniería de Red - Ingeniería Core voz",
             "Gerencia General de Desarrollo de Red - Construcción","Gerencia General de Desarrollo de Red - Implementación, Transporte y Energía","Gerencia General de Desarrollo de Red - Negociaciones","Gerencia General de Desarrollo de Red - Desarrollo, Redes, Acceso y Core",
             "Gerencia General Planificación de Red - Planificación de Acceso Radio","Gerencia General Planificación de Red - Planificación de datos y transporte","Gerencia General Planificación de Red - Redes, Operaciones Empresas","Gerencia General Planificación de Red - Planificación Infraestructura","Gerencia General Planificación de Red - Ing. Y Des. Redes empresas","Gerencia General Planificación de Red - Planificación y Core de Voz",
             "Gerencia de Aseguramiento y Control"]
            ] 

var sc = [["Gerencia General Legal"],
          ["Gerencia de Legal"],
          ["Gerencia General de Compliance y Legal"]
          ] 

var drig = [["Gerencia de Redes Sociales"],
            ["Gerencia de Entorno y Planificación"],
            ["Gerencia de Comunicaciones Corporativas"],
            ["Gerencia de Relaciones, Sector Académico"],
            ["Gerencia de Relaciones Gubernamentales"]
            ]    

var dsf = [["Gerencia de Entes gubernamentales"],
           ["Gerencia General de Servicios","Gerencia de Inmuebles, planificación y tráfico","Gerencia Manteniemiento - Servicios"],
            ["Gerencia General Seguridad Telemática"],
            ["Gerencia de Prevención de Fraudes"],
            ["Gerencia de Seguridad"],
            ["Gerencia Análisis de Riesgo Integral"],
            ["Gerencia de Flota y Administración"],
            ["Gerencia de Arquitectura y Espacios"],
            ["Gerencia de Seguridad"],
            ["Gerencia de Sistemas de Seguridad"]
            ]    

var da = [["Gerencia General de Auditoría"],
          ["Gerencia de Auditoria"],
          ["Gerencia General de Intervención"]
          ] 

var emp = [["Gerencia General de Comercial","Gerencia de Comercial"],
           ["Dir. Planif. Anal. Y Merc. De Empresas","Gerencia de Estrategia y Proyectos","Gerencia de Planificación y Presupuesto","Gerencia de Analítica Comercial","Gerencia de Desarrollo Comercial","Gerencia de Gestión","Gerencia de Mercadeo Soluc. Tradic"],
           ["Gerencia General Ingeniería de Empresas","Gerencia de Operaciones de Canales Virtuales","Gerencia de Ingeniería de Preventa","Gerencia de Ingeniería de Post-Venta","Gerencia de Gestión de Clientes","Gerencia de Tecnologías y Sistemas"],
           ["Gerencia General de TST","Gerencia de operaciones","Gerencia de Infraestructura y Sistemas"],
           ["Dir. Negocios y Contratos Masivos","Gerencia Comercial Negocios Gran Caracas","Gerencia Comercial Negocios Occidente/Andes","Gerencia Ventas Nacional Negocios","Gerencia Comercial Negocios Oriente/Guayana","Gerencia Comercial Negocios PYME A "]
           ] 

var fcg = [["Dir. De Cont. Ges. Contable y Aseg. De Ingresos","Gerencia General Control de Gestión","Gerencia de Contabilidad Análisis Bancos y Rep.","Gerencia General de Aseguramiento de Ingresos","Gerencia Cuentas por Pagar","Gerencia de Reportes y Estudios Análiticos ","Gerencia Contabilidad de Ingresos y Activos"],
           ["Dirección de Finanzas","Gerencia General Cobranzas y Administración - Nacional de Administración","Gerencia General Cobranzas y Administración - Gerencia de Administración de Plataforma","Gerencia General Cobranzas y Administración - Crédito y gestión de Cartera","Gerencia General Cobranzas y Administración - Regional de Cobranzas GGUU","Gerencia General Cobranzas y Administración - Cobranzas, Contratos  y Negocios","Gerencia General Cobranzas y Administración - Recaudación",
            "Gerencia General Facturación y Proc. Financ. - Control Patrimonial y Activo Documental","Gerencia General Facturación y Proc. Financ. - Procesos Económicos y Financieros","Gerencia General Facturación y Proc. Financ. - Comisiones","Gerencia General Facturación y Proc. Financ. - Facturación",
            "Gerencia General de Tesorería - Operaciones de Tesorería","Gerencia General de Tesorería - Riesgo y Seguro","Gerencia General de Tesorería - Planificación Financiera"],
            ["Gerencia General de Impuestos ","Gerencia de Impuestos Directos","Gerencia de Impuestos Indirectos"],
            ["Dirección de Compras y Logística","Gerencia General de Compras - Compras - Tecnología","Gerencia General de Compras - Compras - Servicios y Obras","Gerencia General de Compras - Compras - Publicidad","Gerencia General de Compras - Compras - Redes",
             "Gerencia de Procesos y Estadística",
             "Gerencia General de Logística - Planificación Logística ","Gerencia General de Logística - Operaciones Logística"]            
            ] 

var canales = [["Gerencia General Optimización y Soporte","Gerencia Capacitación atención al cliente","Gerencia Servicio Posventa y TV","Gerencia de Calidad","Gerencia de Procesos Comun y Campañas"],
               ["Dirección de Canales Oeste","Gerencia de Canales","Gerencia de Canal Presidencial"],
               ["Dirección de Canales Este","Gerencia de Canales","Gerencia de Canal Presidencial"],
               ["Gerencia General Canal Telefónicos","Gerencia Nacional Postventa Negocios","Gerencia Atención online y soporte","Gerencia de Gestión resolutiva y televentas"],
               ["Dirección de Planificación de Canales","Gerencia de Logística Comercial","Gerencia de Desarrollo de Negocios","Gerencia Control y Certificación Comercial","Gerencia General Analítica Comercial - Estrategia de Canales","Gerencia General Analítica Comercial - Analítica de Canales","Gerencia de soporte operativo","Gerencia de presupuesto y area gestora","Gerencia de Operaciones y Ventas Recarga  electrónica","Gerencia de Gestión de canales","Gerencia de Trad Marketing"]

               ] 
          

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
    }else if(element.value == "VP PLANIFICACIÓN ESTRATÉGICA, REGUL Y CAL."){
        $("#ggs").empty();
        var blank = document.createElement("option");
            blank.text = " ";
            blank.value = " ";
            $("#ggs").append(blank);
        current = perc
        for( var i = 0; i < current.length ; i++){
            var option = document.createElement("option");
            option.text = current[i][0];
            option.value = current[i][0];
            $("#ggs").append(option);
        }
    }else if(element.value == "VP RECURSOS HUMANOS"){
        $("#ggs").empty();
        var blank = document.createElement("option");
            blank.text = " ";
            blank.value = " ";
            $("#ggs").append(blank);
        current = rrhh
        for( var i = 0; i < current.length ; i++){
            var option = document.createElement("option");
            option.text = current[i][0];
            option.value = current[i][0];
            $("#ggs").append(option);
        }
    } else if(element.value == "GERENCIA GENERAL FUNDACIÓN TELEFÓNICA"){
        $("#ggs").empty();
        var blank = document.createElement("option");
            blank.text = " ";
            blank.value = " ";
            $("#ggs").append(blank);
        current = ggft
        for( var i = 0; i < current.length ; i++){
            var option = document.createElement("option");
            option.text = current[i][0];
            option.value = current[i][0];
            $("#ggs").append(option);
        }
    } else if(element.value == "VP TECNOLOGÍA"){
        $("#ggs").empty();
        var blank = document.createElement("option");
            blank.text = " ";
            blank.value = " ";
            $("#ggs").append(blank);
        current = tech
        for( var i = 0; i < current.length ; i++){
            var option = document.createElement("option");
            option.text = current[i][0];
            option.value = current[i][0];
            $("#ggs").append(option);
        }
    } else if(element.value == "VP SECRETARÍA GENERAL"){
        $("#ggs").empty();
        var blank = document.createElement("option");
            blank.text = " ";
            blank.value = " ";
            $("#ggs").append(blank);
        current = sc
        for( var i = 0; i < current.length ; i++){
            var option = document.createElement("option");
            option.text = current[i][0];
            option.value = current[i][0];
            $("#ggs").append(option);
        }
    } else if(element.value == "DIRECCIÓN RELACIONES INSTITUCIONALES Y GOB."){
        $("#ggs").empty();
        var blank = document.createElement("option");
            blank.text = " ";
            blank.value = " ";
            $("#ggs").append(blank);
        current = drig
        for( var i = 0; i < current.length ; i++){
            var option = document.createElement("option");
            option.text = current[i][0];
            option.value = current[i][0];
            $("#ggs").append(option);
        }
    } else if(element.value == "DIRECCIÓN DE SEGURIDAD Y FRAUDE"){
        $("#ggs").empty();
        var blank = document.createElement("option");
            blank.text = " ";
            blank.value = " ";
            $("#ggs").append(blank);
        current = dsf
        for( var i = 0; i < current.length ; i++){
            var option = document.createElement("option");
            option.text = current[i][0];
            option.value = current[i][0];
            $("#ggs").append(option);
        }
    }else if(element.value == "DIRECCIÓN DE AUDITORÍA"){
        $("#ggs").empty();
        var blank = document.createElement("option");
            blank.text = " ";
            blank.value = " ";
            $("#ggs").append(blank);
        current = da
        for( var i = 0; i < current.length ; i++){
            var option = document.createElement("option");
            option.text = current[i][0];
            option.value = current[i][0];
            $("#ggs").append(option);
        }
    } else if(element.value == "VP EMPRESAS"){
        $("#ggs").empty();
        var blank = document.createElement("option");
            blank.text = " ";
            blank.value = " ";
            $("#ggs").append(blank);
        current = emp
        for( var i = 0; i < current.length ; i++){
            var option = document.createElement("option");
            option.text = current[i][0];
            option.value = current[i][0];
            $("#ggs").append(option);
        }
    } else if(element.value == "VP FINANAZAS Y CONTROL DE GESTIÓN"){
        $("#ggs").empty();
        var blank = document.createElement("option");
            blank.text = " ";
            blank.value = " ";
            $("#ggs").append(blank);
        current = fcg
        for( var i = 0; i < current.length ; i++){
            var option = document.createElement("option");
            option.text = current[i][0];
            option.value = current[i][0];
            $("#ggs").append(option);
        }
    } else if(element.value == "VP CANALES"){
        $("#ggs").empty();
        var blank = document.createElement("option");
            blank.text = " ";
            blank.value = " ";
            $("#ggs").append(blank);
        current = canales
        for( var i = 0; i < current.length ; i++){
            var option = document.createElement("option");
            option.text = current[i][0];
            option.value = current[i][0];
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
    var blank = document.createElement("option");
            blank.text = " - ";
            blank.value = " - ";
            $("#gerencias").append(blank);
        for( var i = 1; i < gg.length ; i++){
            var option = document.createElement("option");
            option.text = gg[i];
            option.value = gg[i];
            $("#gerencias").append(option);
        }

}