module Concerns::Findable 

  def self.find_by_name 
    self.class.all.find{|o| o.name == name}
  end

end