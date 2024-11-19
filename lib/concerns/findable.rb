module Concerns::Findable 
  
  
def find_by_name(name)
 item_by_name = nil
 self.all.each do |item|
   if item.name == name 
     item_by_name = item
   end 
 end 
 item_by_name
end

def find_or_create_by_name(name)
  if self.find_by_name(name)
    self.find_by_name(name)
  else 
    self.create(name)
  end 
end
  
end