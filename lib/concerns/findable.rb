require 'pry'

module Concerns
  module Findable

    def create(name)
      instance = self.new(name)
      instance.save
      instance
    end

    def find_by_name(name)
      self.all.detect{|a| a.name == name }
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end

    def create_from_filename(filename)
      new_from_filename(filename).save
    end

  end


end
