class DashboardsController < ApplicationController

  def show
    @user = current_user
    authorize @user
    @applications = current_user.entertainment_applications
    # @offers =
    @entertainments = current_user.entertainments.where(entertainment_applications: {status: "Accepté"})
  end

end
