class EntertainmentApplicationPolicy < ApplicationPolicy
  # Scope pour policy_scope (nécessaire même si il n'y a pas d'index)
  class Scope < Scope
    def resolve
      # c'est pour  retourner toutes les candidatures pour l’instant
      scope.all
    end
  end


  # Autorise un utilisateur connecté à voir le formulaire
  def new?
    user.present?
  end

  # Autorise un utilisateur connecté à créer une candidature
  def create?
    user.present?
  end

  def accept?
    user.present?
  end

  def first_accept?
    user.present?
  end

  def refused?
    user.present?
  end

  # Autorise un utilisateur connecté à voir la page de confirmation
  def confirmation?
    user.present?
  end

  def destroy?
    user.present?
  end
end
