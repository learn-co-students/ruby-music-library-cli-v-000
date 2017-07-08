module Concerns::Findable
    def find_by_name(name)
      all.select {|x| x.name == name}[0]
    end
    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end 
end


# module Concerns
#   module Findable
#   end
# end
