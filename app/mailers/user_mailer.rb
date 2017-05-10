class UserMailer < ApplicationMailer
	default from: "ricardolira48@gmail.com"


	def signup_confirmation
			@greeting = "Hi"
			mail to: "ricardolira48@hotmail.com", subject: "fuck this" 
	end

end
