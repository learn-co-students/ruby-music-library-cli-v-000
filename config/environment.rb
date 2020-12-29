require 'bundler'
require 'pry'
Bundler.require

module Concerns
  module InstanceMethods
    def save
      self.class.all << self
    end
  end
  
  module Findable
    def find_by_name(name)
      self.all.find{|item|item.name == name}
    end
    
    def find_or_create_by_name(name)
      song = find_by_name(name)
      if song == NIL
        self.create(name)
      else
        song
      end
    end
  end
  
  module ClassMethods
    
    def destroy_all
      self.all.clear
    end
  end
  
end

require_all 'lib'

