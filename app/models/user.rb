class User < ActiveRecord::Base

  def final(course_id)
    fathers = Node.where(father_id: -1, course_id: course_id)
    fathers.inject(0) { |memo, var| memo + var.count }
  end

  def grade_list(course_id)
    @nodes = Node.where(course_id: course_id, father_id: -1)
    #value = node.each do |n|
    #  Value.find_or_create(user_id: id, node_id: id)
    #end
    #fst_node = node.select {|n| n.father_id == -1}
    #[node: node, value: value]
  end

end
