class ImagesMailer < ApplicationMailer

	def email(patient)
		@patient = patient
	     mail(
	  :subject => "DentalImager: You've recieved an image!" ,
	  :to  => 'patrick@paperlesspcs.com' ,
	  :track_opens => 'true'
	)
	end


end
