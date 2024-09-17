require "pry"
module Concerns::Findable
  def find_by_name(name)
    all.detect{|s| s.name == name}
  end

  def create(new_from_filename)
    song = self.new(new_from_filename)
    song.save
    song
  end
  
   def create_from_filename(filename) 
    neb = new_from_filename(filename)
    neb.save
   end
   
   def new_from_filename(empty_variable)
    fishwings=empty_variable.split(" - ")
    artist = Artist.find_or_create_by_name(fishwings[0])
    genre = Genre.find_or_create_by_name(fishwings[2].split(".")[0])
    new(fishwings[1], artist, genre)
    song = Song.find_or_create_by_name(fishwings[1])
   end
   
  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
end
