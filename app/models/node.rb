class Node < ActiveRecord::Base

  belongs_to :course

  def sub_item
    Node.where(father_id: id)
  end

  def has_sub?
    Node.any? {|r| r.father_id == id}
  end

  def is_sub?
    father_id != -1
  end

end
