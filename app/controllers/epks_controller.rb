class EpksController < ApplicationController
  before_action :set_epk, only: %i[ show edit update ]

  # GET /epks/1 or /epks/1.json
  def show
    authorize @epk
  end

  def edit
    authorize @epk
  end

  def update
    authorize @epk
    if @epk.update(epk_params)
      redirect_to edit_epk_path, notice: "EPK mis à jour avec succès"
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_epk
    @epk = current_user
  end

end
