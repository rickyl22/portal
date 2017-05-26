class WelcomeController < ApplicationController

$usuario_id = 0
$caso_id = 0

def detalles_usuario
   database = SQLite3::Database.new( "new.database" )
    @data = database.execute( "select * from usuarios where id ="+params[:ident] )
end

def borrar_usuario
   @id = params[:ident]
   database = SQLite3::Database.new( "new.database" )
   database.execute("delete from usuarios where id = "+@id)
   redirect_to :back
end

def ver_usuarios
    database = SQLite3::Database.new( "new.database" )
    @data = database.execute( "select * from usuarios" )
end  

def cambiar_pass
   if params[:clientes][:newpass] != params[:clientes][:newpass2]
      redirect_to :controller => "welcome", :action => "error_pass"
   else
      database = SQLite3::Database.new( "new.database" )
      database.execute( "update usuarios set password = '"+params[:clientes][:newpass]+"' where id = "+$usuario_id.to_s )
      redirect_to :controller => 'welcome', :action => 'cliente'
   end 
end

def asignar_caso
	database = SQLite3::Database.new( "new.database" )
    database.execute( "update casos set consultor = '"+params[:clientes][:cons]+"' where id = "+params[:ident] )
    redirect_to :controller => 'welcome', :action => 'consultor_lider'
end

def consultor_lider
	database = SQLite3::Database.new( "new.database" )
    @data = database.execute( "select * from casos where infosoft = 'SI'" )
    @consultores = database.execute("select usuario from usuarios where tipo = 'consultor' or tipo = 'consultor-lider'")
end

def download
  send_file(
    "#{Rails.root}/public/Documento_prueba.txt",
    filename: "Documento_prueba.txt",
    type: "application/txt"
  )
end

def ver_cliente
    database = SQLite3::Database.new( "new.database" )
    if params[:ident] != nil
       $caso_id = params[:ident]
    end 
   @ident = (params[:ident] != nil ? params[:ident] : $caso_id )
   @data = database.execute("select * from casos where id = "+@ident)
   @date = database.execute("select fecha_creado from casos where id = "+@ident)
   @resume = Resume.new
   @foram = Date.parse @date[0][0]
   @for2 = Date.parse Time.now.strftime("%Y/%m/%d")
   @diff = @for2.mjd - @foram.mjd
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
   @type = database.execute("select tipo from usuarios where id = "+$usuario_id.to_s)
   if @type[0][0] == 'consultor'
      redirect_to :controller => 'welcome', :action => 'ver_casos_consultor', :params => params
   else 
      redirect_to :controller => 'welcome', :action => 'ver_casos_consultor_lider', :params => params
    end
end

def asig_comp
   database = SQLite3::Database.new( "new.database" )
   @ident = params[:ident]
   @comments = database.execute("select complejidad from casos where id = "+@ident)[0][0]
   if params[:comp] != 'no'
      @comments = params[:comp]
  end
   @titulo = params[:titulo]
   @dias = 7
   if @comments == "Bajo"
   	  @dias = 4
   elsif @comments == "Medio"
   	  @dias = 5
   elsif @comments == "URGENTE"
   	  @dias = 3
   end

   @asignado = database.execute("select infosoft from casos where id = "+@ident)
   database.execute("update casos set complejidad = '"+@comments+"', infosoft = 'SI', status = 'En Proceso', fecha_asig = '"+Time.now.strftime("%Y/%m/%d")+"' where id = "+@ident)
   @user = database.execute("select usuario from casos where id = "+@ident)
   @email = database.execute("select email from usuarios where id = "+@user[0][0].to_s)
   if @asignado[0][0] == "NOOOO"
      UserMailer.signup_confirmation(@comments,@titulo,@dias,@email).deliver
   end
   redirect_to :controller => 'welcome', :action => 'ver_casos_admin', :params => params
end  

def guardar_admin
   database = SQLite3::Database.new( "new.database" )
   @ident = params[:ident]
   @comments = params[:clientes][:comment_admin]
   database.execute("insert into comentarios(id_caso,comentario,autor,fecha) values("+@ident+",'"+params[:clientes][:comment_admin]+"', 'Administrador','"+Time.now.strftime("%Y/%m/%d-%H:%M")+"')")
   redirect_to :controller => 'welcome', :action => 'ver_casos_admin', :params => params
end

def guardar_cons
    database = SQLite3::Database.new( "new.database" )
   @ident = params[:ident]
   @comments = params[:clientes][:comment_admin]
   database.execute("insert into comentarios(id_caso,comentario,autor,fecha) values("+@ident+",'"+params[:clientes][:comment_admin]+"', 'Consultor','"+Time.now.strftime("%Y/%m/%d-%H:%M")+"')")
   @type = database.execute("select tipo from usuarios where id = "+$usuario_id.to_s)
   if @type[0][0] == 'consultor'
      redirect_to :controller => 'welcome', :action => 'ver_casos_consultor', :params => params
   else 
   	  redirect_to :controller => 'welcome', :action => 'ver_casos_consultor_lider', :params => params
   	end
end

def ver_casos_consultor
   database = SQLite3::Database.new( "new.database" )
   @ident = params[:ident]
   @data = database.execute("select * from casos where id = "+@ident)
   @comments = database.execute("select comentario, autor,fecha from comentarios where id_caso = "+@ident)
end

def ver_casos_consultor_lider
   database = SQLite3::Database.new( "new.database" )
   @ident = params[:ident]
   @data = database.execute("select * from casos where id = "+@ident)
   @comments = database.execute("select comentario, autor,fecha from comentarios where id_caso = "+@ident)
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
   @comments = database.execute("select comentario, autor,fecha from comentarios where id_caso = "+@ident)
   @disabled = true
   @cerrado_error = "  El consultor debe cambiar el status a 'Cerrado' antes de ser cerrado"
   if @data[0][5] == "Cerrado"
   	  @disabled = false
   	  @cerrado_error = ""
   end
   
end

def asignar
   database = SQLite3::Database.new( "new.database" )
   @ident = params[:ident]
   database.execute("update casos set infosoft = 'SI', status = 'En Proceso', fecha_asig = '"+Time.now.strftime("%Y/%m/%d")+"' where id = "+@ident)
   redirect_to :controller => 'welcome', :action => 'admin_casos'

end

def crear_usuario
	database = SQLite3::Database.new( "new.database" )
  	@check_user  = database.execute("select * from usuarios where usuario = '"+params[:client][:usuario]+"'")
  	@check_email  = database.execute("select * from usuarios where email = '"+params[:client][:email]+"'")
  	if (@check_user[0]!= nil) or (@check_email[0]!= nil) 
  	    redirect_to :controller => "welcome", :action => "error_crear_usuario"
  	elsif params[:client][:email] != params[:client][:email2]
  		redirect_to :controller => "welcome", :action => "error_email"
  	else
    @gerencia = params[:client][:gerencia]
    @gg = params[:client][:gg]
  	database.execute( "insert into usuarios(usuario,password,tipo,area_vp,gg,gerencia,nombre,cargo,idop,email) values('"+params[:client][:usuario]+"',
                     '"+params[:client][:password]+"','"+params[:client][:tipo]+"','"+params[:client][:area]+"', '"+( @gg != nil ? @gg : " ") +"',
  	                 '"+( @gerencia != nil ? @gerencia : " ") +"', '"+params[:client][:nombre]+"', '"+params[:client][:cargo]+"',
  	                  '"+params[:client][:idop]+"', '"+params[:client][:email]+"')")
  	redirect_to :controller => 'welcome', :action => 'usuario_creado'
    end
end

def cerrar_caso
   database = SQLite3::Database.new( "new.database" )
   @ident = params[:ident]
   database.execute("delete from casos where id = "+@ident)
   redirect_to :controller => 'welcome', :action => 'admin_casos'

end

def admin_casos
	database = SQLite3::Database.new( "new.database" )
    @data = database.execute( "select * from casos where status != 'Cerrado' and infosoft = 'NO' order by infosoft" )
    @data3 = database.execute( "select * from casos where status != 'Cerrado' and infosoft = 'SI' order by infosoft" )
    @data2 = database.execute( "select * from casos where status = 'Cerrado'" )
end

def go_back
    redirect_to(:back)
end

def consultor
	database = SQLite3::Database.new( "new.database" )
  @tipo =  database.execute( "select tipo from usuarios where id = "+$usuario_id.to_s )
  p "tipo"
  p @tipo
  @admin = (@tipo[0][0] == 'consultor' ? 0 : 1)
    @consultor = database.execute( "select usuario from usuarios where id = "+$usuario_id.to_s )
    @data = database.execute("select * from casos where consultor = '"+@consultor[0][0]+"'")

end	

def caso_creado
  	database = SQLite3::Database.new( "new.database" )
    @campos = params[:campos]
    @string = ""
    @campos.each { |x| if x != "" then @string << x +" - " end}
    @string = @string[0...-3]
  	database.execute( "insert into casos(usuario,infosoft,fecha_creado,fecha_requerida,status,parque,altas,arpu,recargas,periodo,condiciones,comentarios,
  		               tipo_archivo, act_tabla,tlv,phone,pre_post,movil,tv,fijo,im,tipo_caso,agrup,especifique,titulo,campos,comment_ad,comment_cons,
                     complejidad,otro, separacion,consultor,fecha_asig,last_comp)
  	                   values("+$usuario_id.to_s+",'NO','"+Time.now.strftime("%Y/%m/%d")+"','"+params[:client]["fecha(1i)"]+"/"+params[:client]["fecha(2i)"]+"/"+params[:client]["fecha(3i)"]+"',
  	                   'Creado', '"+(params[:client][:parque] == '0' ? 'NO' : 'SI' )+"', '"+(params[:client][:altas] == '0' ? 'NO' : 'SI' )+"',
  	                 '"+(params[:client][:arpu] == '0' ? 'NO' : 'SI' )+"', '"+(params[:client][:recargas] == '0' ? 'NO' : 'SI' )+"',
  	                  '"+params[:client]["periodo(1i)"]+"/"+params[:client]["periodo(2i)"]+"/"+params[:client]["periodo(3i)"]+"  -  "+params[:client]["periodo2(1i)"]+"/"+params[:client]["periodo2(2i)"]+"/"+params[:client]["periodo2(3i)"]+"',
  	                  '"+params[:client][:comment]+"','', '"+params[:client][:tipo]+"', '"+(params[:client][:act] == '0' ? 'NO' : 'SI' )+"', '"+(params[:client][:tlv] == '0' ? 'NO' : 'SI' )+"',
  	                   '"+(params[:client][:sp] == '0' ? 'NO' : 'SI' )+"', '"+(params[:client][:pago] == '0' ? 'NO' : 'SI' )+"','"+(params[:client][:movil] == '0' ? 'NO' : 'SI' )+"', '"+(params[:client][:tv] == '0' ? 'NO' : 'SI' )+"','"+(params[:client][:fijo] == '0' ? 'NO' : 'SI' )+"', '"+(params[:client][:im] == '0' ? 'NO' : 'SI' )+"', '"+params[:client][:recu]+"', '"+params[:client][:agrup]+"',
  	                   '"+(params[:client][:especifique] == nil ? 'N/A' : params[:client][:especifique])+"', '"+params[:client][:titulo]+"','"+@string+"','','','No asignada', '"+(params[:client][:other] == '0' ? 'NO' : params[:client][:otro] )+"',
  	                   '"+params[:client][:separacion]+"', -1 , 'No Asignado', 'no')")
  	
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
   #                titulo TEXT, campos TEXT, comment_ad TEXT, comment_cons TEXT, complejidad TEXT,otro TEXT, separacion TEXT, consultor INTEGER,
   #                fecha_asig TEXT, last_comp TEXT)" )
#database.execute("drop table usuarios")
#database.execute("create table if not exists usuarios(id INTEGER PRIMARY KEY,usuario TEXT, password TEXT,tipo TEXT, area_vp TEXT,
 #                 gg TEXT, gerencia TEXT,
#                  nombre TEXT, cargo TEXT, idop TEXT,email TEXT)")
#database.execute("insert into usuarios(usuario,password,tipo , area_vp , gg, gerencia, nombre, cargo, idop) values('admin','admin', 1,1,1,11,1,1,1)")
  
#database.execute("drop table comentarios")
#database.execute("create table if not exists comentarios(id INTEGER PRIMARY KEY, id_caso INTEGER, comentario TEXT, autor TEXT, fecha TEXT)")
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
  		elsif @check[0][3] == "consultor-lider"
  			redirect_to :controller => 'welcome', :action => 'consultor_lider'
  		else
  			redirect_to :controller => 'welcome', :action => 'admin'
  		end
  	else
  		redirect_to :controller => 'welcome', :action => 'login_error'
  	end
  end

  def cliente
  	@resume = Resume.new
  	@resumes = Resume.all
  end

  def crear_caso
	  @otro = 0
  end

  def new
    @resume = Resume.new
  end

  def show

  end

  def create
    @resume = Resume.new(resume_params)
    
    
    if @resume.save
      redirect_to :back, :params => params
    else
      render "new"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice:  "The resume #{@resume.name} has been deleted."
  end

private
  def resume_params
    params.require(:resume).permit(:name, :attachment)
  end
  


end

 