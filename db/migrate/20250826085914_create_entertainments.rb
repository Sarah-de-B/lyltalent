class CreateEntertainments < ActiveRecord::Migration[7.1]
  def change
    create_table :entertainments do |t|
      t.string :artist_type
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :included_services, array: true, default: []
      t.string :artist_experience_in_years
      t.integer :duration_in_minutes
      t.string :available_tool
      t.string :necessary_tool
      t.string :planned_remuneration
      t.integer :planned_remuneration_in_euros
      t.references :event, null: false, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
