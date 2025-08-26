class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :category
      t.integer :duration
      t.string :address
      t.integer :estimated_public_in_number
      t.integer :public_age
      t.string :musical_styles, array: true, default: []
      t.string :cover_or_composition
      t.integer :number_of_artists_needed
      t.string :name
      t.text :description
      t.boolean :vehicule, default: false
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
