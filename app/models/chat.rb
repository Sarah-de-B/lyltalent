class Chat < ApplicationRecord
  belongs_to :user # celui qui a créé la candidature (artiste)
  belongs_to :entertainment_application
  has_many :messages, dependent: :destroy
end
