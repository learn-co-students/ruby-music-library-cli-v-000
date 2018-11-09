require 'pry'

module Concerns::Findable

  def find_by_name(name)
    self.all.detect {|object| object.name == name}
  end

  def find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

end
