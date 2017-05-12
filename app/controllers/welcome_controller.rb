class WelcomeController < ApplicationController

$usuario_id = 0

def download
  send_file(
    "#{Rails.root}/public/neveratrans.pdf",
    filename: "neveratrans.pdf",
    type: "application/pdf"
  )
end

def ver_cliente
    database = SQLite3::Database.new( "new.database" )
   @ident = params[:ident]
   @data = database.execute("select * from casos where id = "+@ident)
end  

def ver_casos_cliente
    database = SQLite3::Database.new( "new.database" )
    @data = database.execute( "select * from casos where usuario = "+$usuario_id.to_s )
end

def cambiar_estatus
   database = SQLite3::Database.new( "new.database" )
   @ident = params[:ident]
   @comments = params[:clientes][:estatus]
   database.execute("update casos set status = '"+@comments+"' where id = "+@ident)
   redirect_to :controller => 'welcome', :action => 'ver_casos_consultor', :params => params
end

def asig_comp
   database = SQLite3::Database.new( "new.database" )
   @ident = params[:ident]
   @comments = params[:clientes][:comp]
   database.execute("update casos set complejidad = '"+@comments+"', infosoft = 'SI', status = 'En Proceso' where id = "+@ident)
   UserMailer.signup_confirmation(@comments).deliver
   redirect_to :controller => 'welcome', :action => 'ver_casos_admin', :params => params
end  

def guardar_admin
   database = SQLite3::Database.new( "new.database" )
   @ident = params[:ident]
   @comments = params[:clientes][:comment_admin]
   database.execute("update casos set comment_ad = '"+@comments+"' where id = "+@ident)
   redirect_to :controller => 'welcome', :action => 'ver_casos_admin', :params => params
end

def guardar_cons
    database = SQLite3::Database.new( "new.database" )
   @ident = params[:ident]
   @comments = params[:clientes][:comment_admin]
   database.execute("update casos set comment_cons = '"+@comments+"' where id = "+@ident)
   redirect_to :controller => 'welcome', :action => 'ver_casos_consultor', :params => params
end

def ver_casos_consultor
   database = SQLite3::Database.new( "new.database" )
   @ident = params[:ident]
   @data = database.execute("select * from casos where id = "+@ident)
end

def comentar
   database = SQLite3::Database.new( "new.database" )
   @ident = params[:clientes][:comment]
   database.execute("update casos set comentarios = '"+@ident+"' where id = "+params[:id])
   redirect_to :controller => 'welcome', :action => 'admin_casos'
end

def ver_casos_admin
   database = SQLite3::Database.new( "new.database" )
   @ident = params[:ident]
   @data = database.execute("select * from casos where id = "+@ident)
end

def asignar
   database = SQLite3::Database.new( "new.database" )
   @ident = params[:ident]
   database.execute("update casos set infosoft = 'SI', status = 'En Proceso' where id = "+@ident)
   redirect_to :controller => 'welcome', :action => 'admin_casos'

end

def crear_usuario
	database = SQLite3::Database.new( "new.database" )
  	
  	database.execute( "insert into usuarios(usuario,password,tipo,area_vp,gg,gerencia,nombre,cargo,idop) values('"+params[:client][:usuario]+"',
                     '"+params[:client][:password]+"','"+params[:client][:tipo]+"','"+params[:client][:area]+"', '"+params[:client][:gg]+"',
  	                 '"+params[:client][:gerencia]+"', '"+params[:client][:nombre]+"', '"+params[:client][:cargo]+"',
  	                  '"+params[:client][:idop]+"')")
  	redirect_to :controller => 'welcome', :action => 'usuario_creado'
end

def cerrar_caso
   database = SQLite3::Database.new( "new.database" )
   p params
   @ident = params[:ident]
   database.execute("delete from casos where id = "+@ident)
   redirect_to :controller => 'welcome', :action => 'consultor'

end

def admin_casos
	database = SQLite3::Database.new( "new.database" )
    @data = database.execute( "select * from casos" )
end

def go_back
    redirect_to(:back)
end

def consultor
	database = SQLite3::Database.new( "new.database" )
    @data = database.execute( "select * from casos where infosoft = 'SI'" )

end	
def caso_creado
  	database = SQLite3::Database.new( "new.database" )
    @campos = params[:campos]
    @string = ""
    @campos.each { |x| if x != "" then @string << x +" - " end}
    @string = @string[0...-3]
  	database.execute( "insert into casos(usuario,infosoft,fecha_creado,fecha_requerida,status,parque,altas,arpu,recargas,periodo,condiciones,comentarios,
  		               tipo_archivo, act_tabla,tlv,phone,pre_post,movil,tv,fijo,im,tipo_caso,agrup,especifique,titulo,campos,comment_ad,comment_cons,complejidad,otro)
  	                   values("+$usuario_id.to_s+",'NO','25/04','"+params[:client]["fecha(1i)"]+"/"+params[:client]["fecha(2i)"]+"/"+params[:client]["fecha(3i)"]+"',
  	                   'Creado', '"+(params[:client][:parque] == '0' ? 'NO' : 'SI' )+"', '"+(params[:client][:altas] == '0' ? 'NO' : 'SI' )+"',
  	                 '"+(params[:client][:arpu] == '0' ? 'NO' : 'SI' )+"', '"+(params[:client][:recargas] == '0' ? 'NO' : 'SI' )+"',
  	                  '"+params[:client]["periodo(1i)"]+"/"+params[:client]["periodo(2i)"]+"/"+params[:client]["periodo(3i)"]+"  -  "+params[:client]["periodo2(1i)"]+"/"+params[:client]["periodo2(2i)"]+"/"+params[:client]["periodo2(3i)"]+"',
  	                  '"+params[:client][:comment]+"','', '"+params[:client][:tipo]+"', '"+(params[:client][:act] == '0' ? 'NO' : 'SI' )+"', '"+(params[:client][:tlv] == '0' ? 'NO' : 'SI' )+"',
  	                   '"+(params[:client][:sp] == '0' ? 'NO' : 'SI' )+"', '"+(params[:client][:pago] == '0' ? 'NO' : 'SI' )+"','"+(params[:client][:movil] == '0' ? 'NO' : 'SI' )+"', '"+(params[:client][:tv] == '0' ? 'NO' : 'SI' )+"','"+(params[:client][:fijo] == '0' ? 'NO' : 'SI' )+"', '"+(params[:client][:im] == '0' ? 'NO' : 'SI' )+"', '"+params[:client][:recu]+"', '"+params[:client][:agrup]+"',
  	                   '"+(params[:client][:especifique] == nil ? 'N/A' : params[:client][:especifique])+"', '"+params[:client][:titulo]+"','"+@string+"','','','No asignada', '"+(params[:client][:other] == '0' ? 'NO' : params[:client][:otro] )+"' )")
  	
    #redirect_to :controller => 'welcome', :action => 'index'
  

 end



 def index
  	
  	require 'sqlite3'
database = SQLite3::Database.new( "new.database" )
usuario_id = 0
#database.execute("drop table casos")
#database.execute( "create table casos(id INTEGER PRIMARY KEY, usuario INTEGER ,infosoft TEXT, fecha_creado TEXT, fecha_requerida TEXT,
 #                 status TEXT,parque TEXT,altas TEXT,arpu TEXT,recargas TEXT, periodo TEXT, condiciones TEXT, comentarios TEXT, tipo_archivo TEXT,
  #                act_tabla TEXT, tlv TEXT, phone TEXT, pre_post TEXT, movil TEXT, tv TEXT, fijo TEXT, im TEXT, tipo_caso TEXT, agrup TEXT, especifique TEXT,
   #                titulo TEXT, campos TEXT, comment_ad TEXT, comment_cons TEXT, complejidad TEXT,otro TEXT)" )
#database.execute("drop table usuarios")
#database.execute("create table if not exists usuarios(id INTEGER PRIMARY KEY,usuario TEXT, password TEXT,tipo TEXT, area_vp TEXT, gg TEXT, gerencia TEXT, nombre TEXT, cargo TEXT, idop TEXT)")
#database.execute("insert into usuarios(usuario,password,tipo , area_vp , gg, gerencia, nombre, cargo, idop) values('admin','admin', 1,1,1,11,1,1,1)")
  end

  def login
  	database = SQLite3::Database.new( "new.database" )
  	@check = database.execute("select * from usuarios u where u.usuario = '"+params[:client][:usuario]+"' and u.password = '"+params[:client][:password]+"'")
  	if (@check[0]!= nil)
  		$usuario_id = @check[0][0]
  		if @check[0][3] == "cliente"
  			redirect_to :controller => 'welcome', :action => 'cliente'
  		elsif @check[0][3] == "consultor"
  			redirect_to :controller => 'welcome', :action => 'consultor'
  		else
  			redirect_to :controller => 'welcome', :action => 'admin'
  		end
  	else
  		redirect_to :controller => 'welcome', :action => 'login_error'
  	end
  end

  def cliente
  	
  end

  def crear_caso
	@otro = 0
  end

  


end

 