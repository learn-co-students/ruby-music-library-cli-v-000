require 'pry'

module Concerns::Findable

    def find_by_name(name)
      self.all.select {|item| item.name == name}.first
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end


end
