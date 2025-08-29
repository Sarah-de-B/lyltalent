
class ChatsController < ApplicationController
  def index
    # On récupère les event_planners liés aux applications acceptées
    @chats = policy_scope(current_user.chats)
    @event_planners = User
                        .where(role: 'event_planner')
                        .joins(:entertainment_applications)
                        .where(entertainment_applications: { user_id: current_user.id, status: 'Accepté' })
                        .distinct
    authorize @chats
  end
end
