class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

acts_as_voter

  has_many :pins
  has_many :comments

  scope :artist, -> { where(artist: true) }


  has_attached_file :avatar, styles: { medium: '152x152#', small: '50x50#' }  
validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/  
end
