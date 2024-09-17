module Concerns::Findable
  def find_by_name(name)
    @selectedObject = nil
    
    self.all.each do |currObject|
      if currObject.name == name
        @selectedObject = currObject
      end
    end
  
  @selectedObject
  end

  def find_or_create_by_name(name)
    @selectedObject = nil
    
    if find_by_name(name) != nil
        find_by_name(name)
    else
        self.new(name)
    end
  end
end