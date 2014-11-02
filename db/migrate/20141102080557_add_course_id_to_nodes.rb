class AddCourseIdToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :course_id, :integer
  end
end
