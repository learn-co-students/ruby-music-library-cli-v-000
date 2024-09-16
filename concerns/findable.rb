module Concerns::Findable

  def find_by_name(name)
    self.all.detect{ |i| i.name == name } #detects the element in the array returned by method "all" by name and returns it implicitly
  end

  def find_or_create_by_name(name)
    self.all.detect{ |i| i.name == name } || self.create(name) #detects the element, OR if that evaluates to false, calls method "create" to make a new one
  end

end