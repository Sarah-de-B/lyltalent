class EntertainmentsController < ApplicationController
  before_action :set_entertainment, only: [:show]
  def show
  end

  private

  def set_entertainment
    @entertainement = Entertainement.find(params[:id])
  end
end
