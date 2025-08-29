
class ChatsController < ApplicationController
  def index
    # On récupère les event_planners liés aux applications acceptées
    @chats = policy_scope(current_user.chats)
    @event_planners = User
                        .where(role: 'event_planner')
                        .joins(:entertainment_applications)
                        .where(entertainment_applications: { user_id: current_user.id, status: 'accepted' })
                        .distinct
    authorize @chats
  end

  def show
    @chat = Chat.find(params[:id])
    authorize @chat
    @messages = @chat.messages
  end



  #   def show
  #   @chat = Chat.find(params[:id])
  #   @new_chat = Chat.new
  #   @message = Message.new
  #   @objective = @chat.objective
  #   @chats = @objective.chats
  # end
end
