class Course < ActiveRecord::Base

  has_many  :nodes

  def sheet_info
    Node.where(course_id: id)
  end

end
