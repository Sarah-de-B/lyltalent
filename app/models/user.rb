class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # USER
  has_many :messages, dependent: :destroy

  # ARTIST
  has_many :availabilities, dependent: :destroy
  has_many :entertainment_applications, dependent: :destroy
  has_many :chats, through: :entertainment_applications

  has_many_attached :photos
  has_many_attached :videos


  # ORGA DEVENT
  has_many :events, dependent: :destroy
end
