require 'pry'

module Concerns::Findable

  def find_by_name(name)
    self.all.detect {|a| a.name == name}
  end

  def find_or_create_by_name(name)
    return self.new(name) if self.all.detect {|a| a.name == name} == nil
    self.all.detect {|a| a.name == name}
  end

end
