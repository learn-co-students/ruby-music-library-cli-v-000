require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(name)
      self.all.each do |x|
        if x.name == name
          return x
        end
      end
      nil
    end

    def find_or_create_by_name(name)
      if find_by_name(name)
        return find_by_name(name)
      else
        return self.create(name)
      end
    end
  end
end

require_all 'lib'
