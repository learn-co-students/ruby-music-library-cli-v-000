require 'bundler'
Bundler.require

module Concerns
  module Findable

    def find_by_name(name)
      self.all.detect {|x| x.name == name}
    end

    def find_or_create_by_name(name)
      if find_by_name(name)
        find_by_name(name)
      else
        self.create(name)
        find_by_name(name)
      end

    end

    def destroy_all
      self.all.clear
    end

    def create(name)
      song = self.new(name)
      song.save
      song
    end
  end

  module Basics

    def save
      self.class.all<<self
    end
  end

  



end

require_all 'lib'
