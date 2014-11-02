class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.integer :node_id
      t.integer :user_id
      t.float :value

      t.timestamps
    end
  end
end
