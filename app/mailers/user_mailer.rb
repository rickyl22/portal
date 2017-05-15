class UserMailer < ApplicationMailer
	default from: "ricardolira48@gmail.com"


	def signup_confirmation(comp,titulo,dias)
			@greeting = "Hi"
			@comp = comp
			@titulo = titulo
			@dias = dias
			mail to: "ricardolira48@hotmail.com", subject: "Caso Asignado" 
	end

end
