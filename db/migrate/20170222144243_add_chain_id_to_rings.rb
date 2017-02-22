class AddChainIdToRings < ActiveRecord::Migration[5.0]
  def change
    add_column :rings, :chain_id, :integer
  end
end
