class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

#   def notification
#     # Ici ton peu récupérer toutes les notifications de l'utilisateur
#     # Exemple si tu as un modèle Notification lié à l'utilisateur  au message ou suggestion etc
#     @notifications = current_user.notifications.order(created_at: :desc)
#     # les plus récentes apparaissent en premier avec desc.
#   end
end
