class EntertainmentApplication < ApplicationRecord
  belongs_to :user              # le candidat
  belongs_to :entertainment
  has_one :chat, dependent: :destroy # 1 candidature → 1 chat

  validates :status, inclusion: { in: ["pending", "accepted", "refused"] }

  after_update :create_chat_if_accepted

  private

  def create_chat_if_accepted
    # Vérifie si le statut a changé
    if saved_change_to_status?
      # Vérifie si le statut est bien "accepted"
      if status == "accepted"
        # Vérifie qu'il n'existe pas encore de chat lié à cette candidature
        unless chats.present?
          Chat.create!(
            entertainment_application: chats,
            user: user,
            message: "La candidature a été acceptée 🎉"
          )
        end
      end
    end
  end
end
