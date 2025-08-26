class EntertainmentApplication < ApplicationRecord
  belongs_to :user
  belongs_to :entertainment
  validates :message, presence: true
  validates :status, inclusion: { in: ["En attente", "Acceptée", "Refusée"] }
end
