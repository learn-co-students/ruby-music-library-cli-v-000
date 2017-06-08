#Concerns::Findable
module Concerns::Findable
  #module ClassMethods
    def find_by_name(name)
      #self.class.all.detect{|a| a.name == name}
      self.all.detect{|a| a.name == name}
    end
  #end
end
