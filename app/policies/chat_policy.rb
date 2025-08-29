class ChatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # c'est pour  retourner toutes les candidatures pour l’instant
      scope.all
    end
  end

  def index?
    user.present?
  end

  def show?
    true
  end
end
