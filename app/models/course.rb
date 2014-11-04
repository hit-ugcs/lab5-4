class Course < ActiveRecord::Base

  has_many  :nodes

  def user_info
    User.all
  end

  def get_first_level_node
    Node.where(course_id: id, father_id: -1)
  end

  def new_child_node
    Node.new
  end

end
