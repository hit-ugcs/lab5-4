class Node < ActiveRecord::Base

  belongs_to :course

  def sub_item
    Node.where(father_id: id)
  end

end
