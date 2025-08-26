class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :artist_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :role, :string
    add_column :users, :address, :string
    add_column :users, :instruments, :string, array: true, default: []
    add_column :users, :musical_styles, :string, array: true, default: []
    add_column :users, :instagram_url, :string
    add_column :users, :facebook_url, :string
    add_column :users, :spotify_url, :string
    add_column :users, :youtube_url, :string
    add_column :users, :covers, :boolean, default: false
    add_column :users, :original_composition, :boolean, default: false
    add_column :users, :stage_time_in_minutes, :integer
    add_column :users, :tools, :string
    add_column :users, :tools_needed, :string
    add_column :users, :legal_entity_type, :string
    add_column :users, :siret, :string
    add_column :users, :concert_number, :integer
    add_column :users, :description_education, :text
    add_column :users, :description_experience, :text
    add_column :users, :price, :string
    add_column :users, :bio, :text
    add_column :users, :artist_type, :string
    add_column :users, :vehicule, :boolean, default: false
    add_column :users, :date_of_birth, :date
    add_column :users, :epk_completed, :boolean, default: false
  end
end
