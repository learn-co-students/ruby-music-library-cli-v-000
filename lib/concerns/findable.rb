module Concerns::Findable
  attr_accessor :artist, :genre
   def find_by_name(name)
    all.find {|song| song.name == name}
  end
end
