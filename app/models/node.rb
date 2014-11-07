class Node < ActiveRecord::Base

  belongs_to :course

  def create(params)
    super(params.merge(child_count: 0))
  end

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

  def binding_value(user_id)
    Value.where(node_id: id, user_id: user_id).first
  end

  def count(user_id)
    if has_sub?
      res = children.inject(0) { |mem, node| mem + node.count(user_id) }
      res * weight / 100.0
    else
      val = binding_value(user_id)
      val.nil? ? 0 : val.value * weight / 100.0
    end
  end

  def label_name
    has_sub? ? "#{name} (#{weight}%)" : "Score"
  end

end
