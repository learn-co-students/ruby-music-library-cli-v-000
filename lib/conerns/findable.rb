module Concerns::Findable 
  def find_by_name(title)
    all.select {|song| song.name == title}.first    
  end
  
    
  def find_or_create_by_name(title)
    find_by_name(title) || create(title)
  end 
  
end 