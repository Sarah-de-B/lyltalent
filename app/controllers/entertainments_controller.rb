class EntertainmentApplicationsController < ApplicationController
  before_action :authenticate_user! # parce qu'on utilise devise

  def new
    @entertainment_application = EntertainmentApplication.new
  end

  def create
    @entertainment_application = EntertainmentApplication.new(entertainment_application_params)
    @entertainment_application.user = current_user # associer l'utilisateur connecté
    @entertainment_application.status = "En attente" if @entertainment_application.status.nil?

    if @entertainment_application.save
      redirect_to confirmation_entertainment_applications_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def confirmation
    # page qui renvoi candidature envoyer
  end

  private

  def entertainment_application_params
    params.require(:entertainment_application).permit(:message, :status, :entertainment_id)
  end
end
