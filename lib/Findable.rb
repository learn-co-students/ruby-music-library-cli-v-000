require 'pry'
module Findable
  def find_by_name(name)
    self.all.detect {|song| song.name == name }
  end

  def find_or_create_by_name(name)
    self.all.collect do |song|
      self.create(name) unless song.name == name
    binding.pry
    end
  end


end
