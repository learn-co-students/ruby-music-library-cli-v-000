require 'bundler'
Bundler.require

module Concerns

  module Findable
    def find_by_name(name)
      all.detect{|x| x.name == name}
    end

    def find_or_create_by_name(name)
      # binding.pry
      all.detect{|x| x.name == name} || self.create(name)
    end
  end
end

require_all 'lib'
