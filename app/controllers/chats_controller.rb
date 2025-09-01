class ChatsController < ApplicationController
  def index

    # On récupère les event_planners liés aux applications acceptées
    if current_user.role == "artiste"
      @chats = policy_scope(
      Chat.joins(:entertainment_application)
          .joins(:messages)
          .where(entertainment_application: { user: current_user })
          .group("chats.id")
          # Trie les enregistrements (par exemple, les chats) en fonction de la date du dernier message, du plus récent au plus ancien
          .order("MAX(messages.created_at) DESC")
    )

    else
      @chats = policy_scope(Chat.joins(entertainment_application: { entertainment: :event })
                                .where(events: {user: current_user}))
    end

    authorize @chats
  end

  def show
    # pour afficher le chat
    @chat = Chat.find(params[:id])
    @messages = @chat.messages.order(created_at: :asc)
    authorize @chat

    @entertainment = @chat.entertainment_application.entertainment
    @user_has_applied = current_user&.entertainment_applications&.find_by(entertainment: @entertainment, status: ["Accepté"])

  end
end
