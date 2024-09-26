module Concerns

  module Findable
    def find_by_name(name)
      #binding.pry
      ary = self.class_variable_get(self.class_variables.first)
      ary.detect{|song| song.name == name}
    end
    
    def find_or_create_by_name(name)
      if self.find_by_name(name) == nil
        self.create(name)
      else
        self.find_by_name(name)
      end
    end
  end
end