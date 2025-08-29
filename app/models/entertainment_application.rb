class EntertainmentApplication < ApplicationRecord
  belongs_to :user
  belongs_to :entertainment
  validates :message, presence: true
  has_one :chat
  validates :status, inclusion: { in: ["pending", "accepted", "refused"] }
end
