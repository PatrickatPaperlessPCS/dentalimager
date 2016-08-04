class ImagesMailer < ApplicationMailer

	def email(patient)
		@patient = patient
	     mail(
	  :subject => "PatientPhotos: view your patient photos!" ,
	  :to  => @patient.email,
	  :track_opens => 'true'
	)
	end


end
