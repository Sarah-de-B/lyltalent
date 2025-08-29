class Chat < ApplicationRecord
  belongs_to :entertainment_application
  has_many :messages, dependent: :destroy
end
