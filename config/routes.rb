Rails.application.routes.draw do
  
  resources :resumes, only: [:index, :new, :create, :destroy]
  resources :file, only: [:index, :new, :create, :destroy]
   
   get 'welcome/asignar_caso'
   root 'welcome#index'
 root "resumes#index"
  get 'resumes/index'

  get 'resumes/new'

  get 'resumes/create'

  get 'resumes/destroy'

  get 'welcome/index'

 
  get 'welcome/admin'
  get 'welcome/login'
  get 'welcome/cliente'
  get 'welcome/crear_caso'
  get 'welcome/caso_creado'
  get 'welcome/consultor'
  post 'welcome/login'
  post 'welcome/index'
  post 'welcome/cliente'
  post 'welcome/consultor'
  post 'welcome/admin'
  post 'welcome/crear_caso'
  post 'welcome/caso_creado'
  get 'welcome/cerrar_caso'
  post 'welcome/cerrar_caso'
  post 'welcome/crear_usuario'
  get 'welcome/crear_usuario'
  post 'welcome/usuario_creado'
  get 'welcome/usuario_creado'
  post 'welcome/login_error'
  get 'welcome/login_error'
  post 'welcome/vista_caso'
  get 'welcome/vista_caso'
  post 'welcome/crear_usuario_vista'
  get 'welcome/crear_usuario_vista'
  post 'welcome/admin_casos'
  get 'welcome/admin_casos'
  post 'welcome/asignar'
  get 'welcome/asignar'
  post 'welcome/ver_casos_admin'
  get 'welcome/ver_casos_admin'
  post 'welcome/comentar'
  get 'welcome/comentar'
  post 'welcome/ver_casos_consultor'
  get 'welcome/ver_casos_consultor'
  post 'welcome/go_back'
  get 'welcome/go_back'
  post 'welcome/guardar_cons'
  get 'welcome/guardar_cons'
  post 'welcome/guardar_admin'
  get 'welcome/guardar_admin'
  post 'welcome/asig_comp'
  get 'welcome/asig_comp'
  post 'welcome/cambiar_estatus'
  get 'welcome/cambiar_estatus'
  post 'welcome/ver_casos_cliente'
  get 'welcome/ver_casos_cliente'
  post 'welcome/ver_cliente'
  get 'welcome/ver_cliente'
  post 'welcome/mineria'
  get 'welcome/mineria'
  post 'welcome/download'
  get 'welcome/download'
  post 'welcome/consultor_lider'
  get 'welcome/consultor_lider'
  post 'welcome/asignar_caso'
  
  post 'welcome/error_crear_usuario'
  get 'welcome/error_crear_usuario'
  post 'welcome/error_email'
  get 'welcome/error_email'
  post 'welcome/opciones_cliente'
  get 'welcome/opciones_cliente'
  post 'welcome/cambiar_pass'
  get 'welcome/cambiar_pass'
  post 'welcome/error_pass'
  get 'welcome/error_pass'
  post 'welcome/ver_casos_consultor_lider'
  get 'welcome/ver_casos_consultor_lider'
  post 'welcome/ver_usuarios'
  get 'welcome/ver_usuarios'
  post 'welcome/create'
  get 'welcome/create'
  post 'welcome/borrar_usuario'
  get 'welcome/borrar_usuario'
  post 'welcome/detalles_usuario'
  get 'welcome/detalles_usuario'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
