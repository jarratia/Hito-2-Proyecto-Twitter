class AddSuspendedToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :suspended, :false
  end
end
