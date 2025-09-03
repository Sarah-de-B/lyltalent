class AddColumnInstrumentsToEntertainments < ActiveRecord::Migration[7.1]
  def change
    add_column :entertainments, :instruments, :string, array: true, default: []
  end
end
