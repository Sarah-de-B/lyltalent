class ChatsController < ApplicationController
  def index
    @chats = policy_scope(
      Chat.joins(:entertainment_application)
          .joins(:messages)
          .where(entertainment_application: { user: current_user })
          .group("chats.id")
          # Trie les enregistrements (par exemple, les chats) en fonction de la date du dernier message, du plus récent au plus ancien
          .order("MAX(messages.created_at) DESC")
    )

    authorize @chats
  end

  def show
    # pour afficher le chat
    @chat = Chat.find(params[:id])
    @messages = @chat.messages.order(created_at: :asc)
    authorize @chat
  end
end
