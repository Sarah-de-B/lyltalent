class EpksController < ApplicationController
  before_action :set_epk, only: %i[ show ]

  # GET /epks/1 or /epks/1.json
  def show
    authorize @epk
  end

  # def edit
  #   @epk = Epk.find(params[:id])
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_epk
    @epk = current_user
  end

end
