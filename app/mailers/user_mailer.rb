class UserMailer < ApplicationMailer
	default from: "ricardolira48@gmail.com"


	def signup_confirmation(comp)
			@greeting = "Hi"
			@comp = comp
			mail to: "ricardolira48@hotmail.com", subject: "Caso Asignado" 
	end

end
