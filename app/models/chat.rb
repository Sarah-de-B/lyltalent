class Chat < ApplicationRecord
  belongs_to :user # celui qui a créé la candidature (artiste)
  belongs_to :entertainment_application

  validates :message, presence: true
end
