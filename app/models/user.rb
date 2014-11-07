class User < ActiveRecord::Base

  has_many :values

  def final(course_id)
    fathers = Node.where(father_id: -1, course_id: course_id)
    res = fathers.inject(0) do |memo, node|
      val = node.count(id)
      memo + (val.nil? ? 0 : val)
    end
    [res, 100].min.round(2)
  end

  def grade_list(course_id)
    @nodes = Node.where(course_id: course_id, father_id: -1)
  end

end
