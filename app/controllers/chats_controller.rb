
class ChatsController < ApplicationController
  def index
    # On récupère les event_planners liés aux applications acceptées
    @chats = policy_scope(Chat.joins(:entertainment_application)
                              .where(entertainment_application: {user: current_user}))

    authorize @chats
  end

  def show
    @chat = Chat.find(params[:id])
    authorize @chat
    @messages = @chat.messages
    @entertainment = @chat.entertainment_application.entertainment
    @user_has_applied = current_user&.entertainment_applications&.find_by(entertainment: @entertainment, status: ["Accepté"])
  end



  #   def show
  #   @chat = Chat.find(params[:id])
  #   @new_chat = Chat.new
  #   @message = Message.new
  #   @objective = @chat.objective
  #   @chats = @objective.chats
  # end
end
