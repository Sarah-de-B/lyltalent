class CreateEntertainmentApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :entertainment_applications do |t|
      t.string :message
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :entertainment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
