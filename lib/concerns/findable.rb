require 'pry'

module Concerns
  module Findable
    def find_by_name(name)
      all.detect{|item| item.name == name }
    end
    def find_or_create_by_name(name)
      res = self.all.detect{|item| item.name == name }
      res = self.create(name) unless res
      res
    end
  end
end
