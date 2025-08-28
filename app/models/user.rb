class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # USER
  has_many :messages, dependent: :destroy

  # ARTIST
  has_many :availabilities, dependent: :destroy
  has_many :entertainment_applications, dependent: :destroy
  has_many :chats, through: :entertainment_applications

  has_many_attached :photos
  has_many_attached :videos

  # validations
  validates :artist_name, uniqueness: true, if: :musician?
  validates :first_name, :last_name, :phone_number, :email, :role, presence: true

  validate :at_least_one_photo, if: :musician?

  validates :role, inclusion: { in: ['artiste', "organisateur d'événements"] }


  # validations urls
  # validates :instagram_url, format: {
  #   with: /\A(?:https?:)?\/\/(?:www\.)?(?:instagram\.com|instagr\.am)\/[A-Za-z0-9_\.]+\z/,
  #   message: "must be a valid Instagram URL"
  # }, allow_blank: true

  # validates :facebook_url, format: {
  #   with: /\A(?:https?:)?\/\/(?:www\.)?(?:facebook|fb)\.com\/[A-Za-z0-9_\-\.]+\/?\z/,
  #   message: "must be a valid Facebook URL"
  # }, allow_blank: true

  # validates :youtube_url, format: {
  #   with: /\A(?:https?:)?\/\/(?:(?:www\.)?youtube\.com\/(?:watch\?v=|embed\/)|youtu\.be\/)[A-Za-z0-9\-_]+\z/,
  #   message: "must be a valid YouTube URL"
  # }, allow_blank: true

  # validates :spotify_url, format: {
  #   with: /\A(?:https?:\/\/open\.spotify\.com\/(track|user|artist|album)\/[a-zA-Z0-9]+(\/playlist\/[a-zA-Z0-9]+)?|spotify:(track|user|artist|album):[a-zA-Z0-9]+(:playlist:[a-zA-Z0-9]+)?)\z/,
  #   message: "must be a valid Spotify URL"
  # }, allow_blank: true

  # ORGA DEVENT
  has_many :events, dependent: :destroy

  private

  def musician?

    role == 'artiste'
  end
  # def musician?= role == 'artiste'


  def at_least_one_photo
    if photos.blank?
      errors.add(:photos, "must have at least one photo")
    end
  end
end
