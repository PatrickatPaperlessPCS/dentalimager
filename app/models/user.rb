class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :confirmable

  has_many :images#, :through => :patients
  has_many :patients


  	validates :name, :presence => true
  	validates :telephone, :presence => true
  	validates :agreement, :presence => true, :on => :create

  after_create :send_sign_up_email

  def send_sign_up_email
	Usermailer.sign_up(id).deliver_later
  end
end
