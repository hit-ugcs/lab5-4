class User < ActiveRecord::Base


  def final
    vals = Value.find(user_id: id)
    
  end

end
