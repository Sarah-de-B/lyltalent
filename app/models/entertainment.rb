class Entertainment < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true
  has_many :entertainment_applications, dependent: :destroy
end
