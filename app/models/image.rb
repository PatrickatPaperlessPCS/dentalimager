class Image < ActiveRecord::Base
require 'aws-sdk'


	has_attached_file :image_file, 
    # :styles => {
    #   :thumb => "100x100#",
    #   :original => "1500x1500>"}
url: "/esignhealth/images/:id/:filename", path:"/esignhealth/images/:id/:filename"
	# validates_attachment_file_name :image_file, matches: [/png\Z/, /jpeg\Z/, /tiff\Z/, /bmp\Z/, /jpg\Z/]
   validates_attachment_content_type :image_file, content_type: /\Aimage\/.*\Z/
   # validates :image_file, :presence => true
  	validates :patient_name, :presence => true

  	belongs_to :user

  		before_create :add_token
		private
		def add_token
		  begin
		    self.token = SecureRandom.hex[0,10].upcase
		  end while self.class.exists?(token: token)
		end


end
