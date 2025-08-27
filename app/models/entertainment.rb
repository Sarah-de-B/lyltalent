class Entertainment < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true
  has_many :entertainment_applications, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_address,
    associated_against: {
      event: [ :address]
    },
    using: {
      tsearch: { prefix: true }
    }
end
