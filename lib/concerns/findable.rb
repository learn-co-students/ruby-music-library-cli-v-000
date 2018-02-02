module Concerns
  module Findable

  def find_by_name(name)
    all.detect {|x| x.name == name}
    #this is a class method (we call it with extend)so self IS the class.
    #this reads as Song.all or Artist.all
  end

  def find_or_create_by_name(name)
    find_by_name(name) ||  create(name)
  end

  end
end
