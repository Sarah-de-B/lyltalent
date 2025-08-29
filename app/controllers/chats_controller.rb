
class ChatsController < ApplicationController
  def index
    # On récupère les event_planners liés aux applications acceptées
    @chats = policy_scope(Chat.joins(:entertainment_application)
                              .where(entertainment_application: {user: current_user}))
    # @event_planners = User
    #                     .where(role: "organisateur d'événements")
    #                     .joins(:entertainment_applications)
    #                     .where(entertainment_applications: { user_id: current_user.id, status: 'accepted' })
    #                     .distinct
    authorize @chats
  end
end
