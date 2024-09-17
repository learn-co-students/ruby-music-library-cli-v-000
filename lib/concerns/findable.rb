require 'pry'

module Concerns::Findable

  def find_by_name(name)
      all.detect { |object| object.name == name }
  end

  def find_or_create_by_name(name)
    s = self.find_by_name(name)
    if s == nil
      self.create(name)
    else
      s
    end
  end

end
