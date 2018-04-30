require 'bundler'
Bundler.require

module Concerns
  module Findable

    def find_by_name(name)
      all.detect{|a| a.name == name}
    end

    def create(name)
      new(name).tap { |it| it.save }
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end

  end

  module Stringable
    def to_s
      name
    end

    def <=>(other)
      self.name <=> other.name
    end
    
  end
end

require_all 'lib'
