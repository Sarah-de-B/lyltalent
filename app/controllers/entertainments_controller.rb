class EntertainmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  skip_after_action :verify_authorized, only: [:map]
  before_action :set_entertainment, only: [:show]

  def index
    @entertainments = policy_scope(Entertainment.where(user: nil)).order(starts_at: :desc)
    if params[:query].present?
      @entertainments = @entertainments.search_by_address(params[:query])

    end
  end

  def show
    authorize @entertainment
    @participating_artists = @entertainment.event.users
    @entertainment = Entertainment.find(params[:id])

    @user_has_applied = current_user&.entertainment_applications&.find_by(entertainment: @entertainment, status: ["En cours", "Accepté", "Validé"])
    @is_proposed = current_user&.entertainment_applications&.find_by(entertainment: @entertainment, status: "Proposé")
    # @user_has_applied = Entertainment_applications.where(entertainment: @entertainment, user: current_user)
   @entertainment_application = current_user.entertainment_applications.find_by(entertainment: @entertainment)
  end

  def map
    @entertainments = Entertainment.includes(:event).all
    authorize Entertainment
    @markers = @entertainments.map do |entertainment|
      event = entertainment.event

    if event.latitude && event.longitude
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window: "#{event.name}<br>#{event.address}"
      }
    end
    end.compact
  end


  private

  def set_entertainment
    @entertainment = Entertainment.find(params[:id])
  end
end
