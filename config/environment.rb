require 'bundler'
require 'pry'
Bundler.require

module Concerns
  module Findable

    def find_by_name(name)
      self.all.find { |instance| instance.name == name }
    end

    # def find_or_create_by_name(name)
    #   self.all.find(self.create(name)) { |instance| instance.name == name }
    # end

    def find_or_create_by_name(name)
      return self.find_by_name(name) if self.find_by_name(name) != nil
      self.create(name)
    end

  end
end

require_all 'lib'
