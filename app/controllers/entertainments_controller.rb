class EntertainmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_entertainment, only: [:show]

  def index
    @entertainments = policy_scope(Entertainment)
    if params[:query].present?
      @entertainments = @entertainments.search_by_address(params[:query])
    end
  end

  def show
    authorize @entertainment
    @participating_artists = @entertainment.event.users
  end

  private

  def set_entertainment
    @entertainment = Entertainment.find(params[:id])
  end
end
