module Concerns::Findable
  def find_or_create_by_name(a_name)
    
    found = self.all.detect {|a| a.name == a_name}
    if found.nil?
      found = self.create(a_name)
    end
    found

  end

  def find_by_name(name)
      self.all.detect{|a| a.name == name}




  end


end
