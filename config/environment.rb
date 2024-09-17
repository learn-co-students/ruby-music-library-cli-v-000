require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(name)
      if self.all.find{|obj| obj.name == name}
        self.all.find{|obj| obj.name == name}
      end
    end
    
    def find_or_create_by_name(name)
      if self.find_by_name(name)
        self.find_by_name(name)
      else
        self.create(name)
      end
    end
  end 
end

require_all 'lib'
