class AddChildCountToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :child_count, :integer
  end
end
