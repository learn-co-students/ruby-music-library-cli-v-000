require 'bundler'
Bundler.require

module Concerns
  module Findable
  	def find_by_name(name)
    	self.all.find {|obj| obj.name == name}
  	end

  	def find_or_create_by_name(name)
	    foundobj = self.all.find {|obj| obj.name == name}
	    if foundobj == nil
	      self.create(name)
	    else
	      foundobj
	    end
  	end
  end
end

require_all 'lib'
