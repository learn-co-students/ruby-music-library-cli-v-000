require 'bundler'
Bundler.require


module Concerns
  module Findable
    def find_by_name(name)
        self.all.detect { |a| a.name == name }
    end

    def create(name)
      self.new(name).save
    end

    def find_by_name(name)
      self.all.each do |song|
        if song.name == name
          return song
        end
      end
      false
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name)
        self.find_by_name(name)
      else
        self.create(name)
      end
    end
  end

end

require_relative '../lib/concerns/findable.rb'


require_all 'lib'
