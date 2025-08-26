class CreateAvailabilities < ActiveRecord::Migration[7.1]
  def change
    create_table :availabilities do |t|
      t.date :starts_on
      t.date :ends_on
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
