module Concerns::Findable

  def find_by_name(name)
<<<<<<< HEAD
    self.all.detect {|s| s.name == name}
=======
  self.all.detect {|s| s.name == name}
>>>>>>> 6197a1617fb2d89b09bd81d034e133eed61f6d13
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
end
