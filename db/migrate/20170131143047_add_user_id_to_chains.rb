class AddUserIdToChains < ActiveRecord::Migration[5.0]
  def change
    add_column :chains, :user_id, :integers
  end
end
