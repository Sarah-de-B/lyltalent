class EntertainmentApplication < ApplicationRecord
  belongs_to :user
  belongs_to :entertainment
  has_one :chat, dependent: :destroy
  validates :message, presence: true
  validates :user_id, uniqueness: { scope: :entertainment_id }

  validates :status, inclusion: { in: ["En cours", "Accepté", "Refusé", "Proposé", "Validé"] }

end
