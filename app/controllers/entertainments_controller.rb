class EntertainmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
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
    @entertainment_application = current_user&.entertainment_applications&.find_by(entertainment: @entertainment)
  end

  def map
  @events = Event.all
  authorize @events
  @markers = @events.map do |event|
    {
      lat: event.latitude,
      lng: event.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { event: event }),
      marker_html: render_to_string(partial: "marker", locals: {event: event})
    }
  end
  end

  private

  def set_entertainment
    @entertainment = Entertainment.find(params[:id])
  end
end
