class EntertainmentApplication < ApplicationRecord
  belongs_to :user              # le candidat
  belongs_to :entertainment
  validates :message, presence: true

  validates :status, inclusion: { in: ["En cours", "Accepté", "Refusé", "Proposé", "Validé"] }
end
