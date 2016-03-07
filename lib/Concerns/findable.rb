module Concerns
  module Findable
  
    def find_by_name(name)
      self.all.detect(name)
    end

    def find_or_create_by_name(name)
      result = self.all.find {|element| element.name == name}
      result != nil ? result : self.new(name)
    end
  end
end