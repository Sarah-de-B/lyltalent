class EntertainmentsController < ApplicationController
  before_action :set_entertainment, only: [:show]
  def show
    authorize @entertainment
  end

  private

  def set_entertainment
    @entertainment = Entertainment.find(params[:id])
  end
end
