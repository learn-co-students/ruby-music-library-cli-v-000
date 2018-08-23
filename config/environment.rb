require 'bundler'
Bundler.require
require "pry"

module Concerns
  module Findable
    def find_by_name(name)
      all.detect{|a| a.name == name}
      #binding.pry
    end
    
    def find_or_create_by_name(name)
      if find_by_name(name)
        find_by_name(name)
      else
        create(name)
      end
    end
  end
end

require_all 'lib'
