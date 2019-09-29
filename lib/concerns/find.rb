module Concerns::Findable
  def find_by_name(name)
    @found = self.all.detect {|entity| name == entity.name}
    @found
  end
  
  def find_or_create_by_name(name)
#    if found = self.all.detect {|entity| name == entity.name}
#        found
#    else
#      new = self.new(name)
#      new.save
#      new
#    end

#  end
    if @found = self.find_by_name(name) 
      @found
    else
      self.create(name)
    end
  end
end