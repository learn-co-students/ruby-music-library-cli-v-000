require 'bundler'
Bundler.require

module Concerns

  module Findable #!! Class Methods!!
    def find_by_name(name)
      self.all.find {|element| name == element.name}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    end
  end
  
end

require_all 'lib'
