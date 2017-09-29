require 'bundler'
Bundler.require

module Concerns
  module Findable
    class Person
    end
    
    def find_by_name(name)
      self.all.find {|i| i.name == name}
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name) == nil
        self.new(name)
      else
        self.find_by_name(name)
      
      end
    end

    
  end
end

require_all 'lib'
