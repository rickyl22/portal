class UserMailer < ApplicationMailer
	default from: "ricardolira48@gmail.com"


	def signup_confirmation(comp,titulo,dias,email)
			@greeting = "Hi"
			@comp = comp
			@titulo = titulo
			@dias = dias
			mail to: email, subject: "Caso Asignado" 
	end

end
