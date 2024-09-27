module Concerns::Findable 
  # require 'pry'
  def find_by_name(object)
    self.all.detect {|o| o.name == object}
    
  end

  def find_or_create_by_name(object)
    find_by_name(object) || create(object)
  
  end
# binding.pry
end