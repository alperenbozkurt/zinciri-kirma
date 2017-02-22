class CreateRings < ActiveRecord::Migration[5.0]
  def change
    create_table :rings do |t|
      t.integer :day
      t.string :info

      t.timestamps
    end
  end
end
