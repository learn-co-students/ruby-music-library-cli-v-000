require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(name)
      #using self.all in place of @@artists or @@songs as output of self.all in each of..
      #the Class is @@artists or @@songs
      self.all.detect{|a| a.name == name}
    end

    def create_by_name(name)
      instance = self.new(name)
      self.all << instance
      instance
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
    end
  end
end

require_all 'lib'
