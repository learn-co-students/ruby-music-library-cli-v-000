require 'bundler'
Bundler.require

module Concerns
  module Findable

    def find_by_name(name)
      self.all.find{|s| s.name == name}
    end

    def find_or_create_by_name(name)
      found = self.find_by_name(name)
      if found
        found
      else
        self.create(name)
      end
    end

  end
end

require_all 'lib'
