class Chat < ApplicationRecord
  belongs_to :entertainment_application
  has_many :messages, dependent: :destroy

  def last_message
    messages.order(created_at: :desc).first
  end
end
