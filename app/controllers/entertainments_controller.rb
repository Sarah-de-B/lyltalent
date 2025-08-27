class EntertainmentsController < ApplicationController
  before_action :set_entertainment, only: [:show]

  def index
    @entertainments = policy_scope(Entertainment)
    if params[:query].present?
      @entertainments = @entertainments.search_by_address(params[:query])
    end
  end

  def show
    authorize @entertainment
  end

  private

  def set_entertainment
    @entertainment = Entertainment.find(params[:id])
  end
end
