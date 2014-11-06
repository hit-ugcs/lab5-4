class Value < ActiveRecord::Base

  def count
    node = Node.find(node_id)
    value * node.weight / 100.0
  end


end
