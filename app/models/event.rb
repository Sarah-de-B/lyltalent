class Event < ApplicationRecord
  belongs_to :user
  has_many :entertainments, dependent: :destroy
  has_one_attached :photo
end
