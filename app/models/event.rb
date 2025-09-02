class Event < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :entertainments, dependent: :destroy
  has_many :users, through: :entertainments
  has_one_attached :photo

  validates :name, length: { minimum: 20, maximum: 40 }
  validates :description, length: { minimum: 30, maximum: 60 }
end
