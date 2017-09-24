require 'bundler'
Bundler.require

module Concerns
  module Findable

    def create_by_name(name)
      holder=self.new(name)
      self.all<<holder
       holder
    end

    def find_by_name(name)
      self.all.detect {|song| song.name==name}
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name)!=nil
      else
        self.create_by_name(name)
      end
      self.find_by_name(name)
    end

      end
    end

require_all 'lib'
