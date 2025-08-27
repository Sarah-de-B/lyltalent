class EntertainmentsController < ApplicationController

  def index
    @entertainments = policy_scope(Entertainment)

    if params[:query].present?
      @entertainments = @entertainments.search_by_address(params[:query])
    end
  end
end
