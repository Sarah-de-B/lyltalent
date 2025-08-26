class EntertainmentsController < ApplicationController

  def index
    @entertainments = policy_scope(Entertainment)
  end

end
