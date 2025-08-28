class AvailabilitiesController < ApplicationController
  def index
    @entertainments = current_user.entertainments.where(entertainment_applications: {status: "accepted"})
  end
end
