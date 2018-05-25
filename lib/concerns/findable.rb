module Concerns::Findable
  def find_by_name(title)
    self.all.find {|instance| instance.name == title}.class
  end 
  
  def find_or_create_by_name(title)
    find_by_name(title) ? find_by_name(title) : create(title)
  end
  
end