class EntertainmentApplication < ApplicationRecord
  belongs_to :user
  belongs_to :entertainment
  has_one :chat, dependent: :destroy
  validates :message, presence: true


  validates :status, inclusion: { in: ["En cours", "Accepté", "Refusé", "Proposé", "Validé"] }

end
