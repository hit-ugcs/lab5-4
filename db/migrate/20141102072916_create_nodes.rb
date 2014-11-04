class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :name
      t.integer :weight
      t.integer :father_id

      t.timestamps
    end
  end
end
