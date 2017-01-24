class CreateChains < ActiveRecord::Migration[5.0]
  def change
    create_table :chains do |t|
      t.string :name
      t.string :desc
      t.integer :break

      t.timestamps
    end
  end
end
