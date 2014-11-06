class Node < ActiveRecord::Base

  belongs_to :course

  def children
    Node.where(father_id: id)
  end

  def has_sub?
    child_count != 0
  end

  def is_sub?
    father_id != -1
  end

  def father
    father_id == -1 ? nil : Node.find(father_id)
  end

end
