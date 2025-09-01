class EntertainmentApplicationsController < ApplicationController
  before_action :set_entertainment_application, only: [:accept, :refused, :first_accept ]

  def new
    @entertainment = Entertainment.find(params[:entertainment_id])
    @entertainment_application = EntertainmentApplication.new
    authorize @entertainment_application
  end

  def create
    @entertainment = Entertainment.find(params[:entertainment_id])
    @entertainment_application = EntertainmentApplication.new(entertainment_application_params)
    @entertainment_application.user = current_user
    @entertainment_application.entertainment = @entertainment
    @entertainment_application.status = "En cours"
    authorize @entertainment_application

    if @entertainment_application.save
      redirect_to confirmation_entertainment_entertainment_applications_path(@entertainment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Bouton côté event planner pour accepter une candidature
  def accept
    authorize @entertainment_application

    if @entertainment_application.update(status: "Accepté")
      redirect_to dashboard_path, notice: "Candidature acceptée et chat créé !"
    else
      redirect_to dashboard_path, alert: "Impossible d’accepter la candidature."
    end
  end

  def first_accept
    authorize @entertainment_application

    if @entertainment_application.update(status: "Validé")
      redirect_to dashboard_path, notice: "Vous venez d'être recommandé à l'organisateur de l'événement !"
    else
      redirect_to dashboard_path, alert: "Impossible d’accepter la candidature."
    end
  end

  def refused
    authorize @entertainment_application

    if @entertainment_application.update(status: "Refusé")
      redirect_to dashboard_path, notice: "Candidature acceptée et chat créé !"
    else
      redirect_to dashboard_path, alert: "Impossible d’accepter la candidature."
    end
  end

  def confirmation
    @entertainment = Entertainment.find(params[:entertainment_id])
    authorize EntertainmentApplication
  end

  def destroy
    @entertainment_application = EntertainmentApplication.find(params[:id])
    authorize @entertainment_application
    if @entertainment_application.chat
      @entertainment_application.chat.messages.destroy_all
      @entertainment_application.chat.destroy
    end
    @entertainment_application.destroy
    redirect_to  entertainments_path, notice: "Candidature supprimée avec succès"
  end

  private

  def set_entertainment_application
    @entertainment_application = EntertainmentApplication.find(params[:id])
  end

  def entertainment_application_params
    params.require(:entertainment_application).permit(:message)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
