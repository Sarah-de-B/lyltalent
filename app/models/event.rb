class Event < ApplicationRecord
  belongs_to :user
  has_many :entertainments, dependent: :destroy
  has_many :users, through: :entertainments
  has_one_attached :photo
end
