require 'bundler'
Bundler.require

module Concerns

  module Findable

  def find_or_create_by_name(name)
      self.all.each {|x|
        if x.name == name
          return x
        end
      }
      x = self.new(name)
      self.all << x
      return x
  end

  def find_by_name(name)
  	self.all.find {|x|
  	  	x.name == name
  	  }
  end

  end
end

require_all 'lib'
