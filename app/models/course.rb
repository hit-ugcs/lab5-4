class Course < ActiveRecord::Base

  has_many  :nodes


  def sheet_info
    Node.where(course_id: id, father_id: -1)
  end

  def node_info
    Node.where(course_id: id, father_id: -1)
  end

  def user_info
    User.all
  end

end
