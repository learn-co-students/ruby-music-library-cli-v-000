require 'bundler'
Bundler.require

module Concerns

  module ClassHelper

    def destroy_all
      self.all.clear
    end

    def create(name)
      o = self.new(name)
      self.all << o
      o
    end

  end

  module InstanceHelper

    def save
      self.class.all << self
    end

  end

  module Findable

    def find_by_name(name)
      self.all.detect {|o| o.name == name}
    end

    def find_or_create_by_name(name)
      find = self.find_by_name(name)
      return find if defined? find and not find.nil?
      self.create(name)
    end

  end

end

require_all 'lib'
