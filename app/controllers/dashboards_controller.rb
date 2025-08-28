class DashboardsController < ApplicationController

  def show
    @user = current_user
    authorize @user
    @applications = current_user.entertainment_applications
    # @offers =
  end

end
