require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(name)
      found_obj = nil

      self.all.each do |obj|
        if obj.name == name
          found_obj = obj
        end
      end

      found_obj
    end

    def find_or_create_by_name(name)
      if !self.find_by_name(name)
        self.create(name)
      else
        self.find_by_name(name)
      end
    end

  end
end

require_all 'lib'
