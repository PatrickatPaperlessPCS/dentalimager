class Usermailer < ApplicationMailer

	def sign_up(id)
	@user = User.find(id)	
		mail(
	  :subject => 'New Sign Up' ,
	  :to  => 'patrick@patientphotos.net' ,
	  :track_opens => 'true'
		)
	end
end
