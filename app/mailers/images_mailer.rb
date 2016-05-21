class ImagesMailer < ApplicationMailer

	def email(image)
		@image = image
	     mail(
	  :subject => "DentalImager: You've recieved an image!" ,
	  :to  => 'patrick@paperlesspcs.com' ,
	  :track_opens => 'true'
	)
	end

end
