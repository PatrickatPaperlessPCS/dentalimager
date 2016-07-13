class Patient < ActiveRecord::Base
has_many :images
accepts_nested_attributes_for :images#, reject_if: :all_blank, allow_destroy: true
belongs_to :user

  before_create :add_token
		private
		def add_token
		  begin
		    self.token = SecureRandom.hex[0,10].upcase
		  end while self.class.exists?(token: token)
		end
end
