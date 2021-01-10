class AddHiddenToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :hidden, :boolean, :default => false

    Message.update_all ["hidden = ?", false]
  end
end
