class DashboardsController < ApplicationController

  def show
    @user = current_user
    authorize @user
    @applications = current_user.entertainment_applications
    @entertainments = current_user.entertainments.where(entertainment_applications: { status: ["Accepté", "Validé"] })
  end
end
