class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user
  validates :content, presence: true
  after_create_commit :broadcast_message

  def sender?(a_user)
    user.id == a_user.id
  end

private

  def broadcast_message
    broadcast_append_to "chat_#{chat.id}_messages",
                        partial: "messages/message",
                        target: "messages",
                        locals: { message: self, user: user }
  end

end
