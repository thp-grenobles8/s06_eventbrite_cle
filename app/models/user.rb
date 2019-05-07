class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :attendances, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :administrations, foreign_key: 'administrator_id', class_name: "Event"
  
  after_create :welcome_send 

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
