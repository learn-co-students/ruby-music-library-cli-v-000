require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect{|element| element.name == name}
    end

    def find_or_create_by_name(name)
      if !self.find_by_name(name)
        self.create(name)
      else
        self.find_by_name(name)
      end
    end

    def destroy_all
      self.all.clear
    end

    def create(name)
      #Artist.new(name).tap{|artist| artist.save}
      self.new(name).save
    end

  end
  module Saveable
    def save
      self.class.all << self
      self
    end
  end
end

require_all 'lib'
