class ImagesMailer < ApplicationMailer

	def email(image)
		@image = image
	     mail(
	  :subject => 'Please Review and Sign' ,
	  :to  => 'patrick@paperlesspcs.com' ,
	  :track_opens => 'true'
	)
	end

end
