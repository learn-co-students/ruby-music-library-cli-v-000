module Concerns::Findable

  module Findable

  #def print_class
  #  puts self
  #end

  def find_by_name(name)
    self.all.detect {|i| i.name == name}
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

end

end
