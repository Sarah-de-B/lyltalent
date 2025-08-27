class EntertainmentApplicationsController < ApplicationController

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
    @entertainment_application.status = "pending"
    authorize @entertainment_application

    if @entertainment_application.save
      redirect_to confirmation_entertainment_entertainment_applications_path(@entertainment)
    else
      render :new, status: :unprocessable_entity

    end
  end

  # Page de confirmation après envoi
  def confirmation
    @entertainment = Entertainment.find(params[:entertainment_id])
    authorize EntertainmentApplication
  end

  private

  def entertainment_application_params
    params.require(:entertainment_application).permit(:message)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
