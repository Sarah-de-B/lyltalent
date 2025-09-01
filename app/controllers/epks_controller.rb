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
    if @epk.update(user_params)
      redirect_to epk_path, notice: "EPK mis à jour avec succès !"
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_epk
    @epk = current_user
  end

  def user_params
    params.require(:user).permit(
      :artist_name, :artist_type, :bio, :original_composition, :covers,
      :description_experience, :concert_number, :description_education,
      :tools, :tools_needed, :vehicule, :legal_entity_type, :siret,
      :phone_number, :instagram_url, :facebook_url, :spotify_url, :youtube_url, :address,
      instruments: [], musical_styles: [],
      videos: [], photos: []
    )
  end

end
