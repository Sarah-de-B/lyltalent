class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def notification
    # Messages des organisateurs de moins de 24h
    @messages = Message
                  .where("created_at >= ?", 24.hours.ago)
                  .where(user: User.where(role: "organisateur d'événements"))
                  .order(created_at: :desc)

    # EntertainmentApplications acceptées ou proposées de moins de 24h
    @entertainment_applications = EntertainmentApplication
                                    .where("created_at >= ?", 24.hours.ago)
                                    .where(status: ["accepté", "proposé"])
                                    .order(created_at: :desc)

    # Nouveaux événements de moins de 24h
    @recent_events = Event.where("created_at >= ?", 24.hours.ago).order(created_at: :desc)
  end
end
