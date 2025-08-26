class Event < ApplicationRecord
  belongs_to :user
  has_many :entertainments, dependent: :destroy
end
