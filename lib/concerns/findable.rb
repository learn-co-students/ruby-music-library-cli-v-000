module Concerns::Findable

  def find_by_name(name)
    self.all.detect {|song| song.name == name} # detect the first element in the @@all [] that is == to the argument being passed in
  end

  def find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name) # execute the class method if returns true with the argument being passed in
    else
      create(name) # use the class method .create and make a new instance of the Song class
    end
  end

end
