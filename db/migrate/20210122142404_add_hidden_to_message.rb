class AddHiddenToMessage < ActiveRecord::Migration[6.0]
  def up
    add_column :messages, :hidden, :boolean
  end

  def down
    remove_column :messages
  end
end
