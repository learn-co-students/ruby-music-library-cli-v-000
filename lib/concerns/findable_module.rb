module Concerns::Findable
  def find_by_name(name)
    self.all.detect{|instance| instance.name == name}
  end
  
  def find_or_create_by_name(name)
    instance = self.find_by_name(name)
    
    instance.nil? ? self.create(name) : instance
  end
end