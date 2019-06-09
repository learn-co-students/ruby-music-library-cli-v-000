require 'bundler'
Bundler.require

module Concerns
  module Findable
    
    def find_by_name(name)
      self.all.detect{|a| a.name == name}
    end
    
    def find_or_create_by_name(name)
      if self.find_by_name(name)
        self.find_by_name(name)
      else
        self.create(name) #tried self.class.create(name) but that didn't work
      end
    end
    
  end
end

require_all 'lib'
