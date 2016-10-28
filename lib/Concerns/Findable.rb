require "pry"

module Concerns::Findable
  ##module InstanceMethods

  def create_from_filename(songname)
    array = songname.split(" - ")
    song = self.find_or_create_by_name(array[1])
    song.artist = Artist.find_or_create_by_name(array[0])
    song.genre = Genre.find_or_create_by_name(array[2].split(".")[0])
    song
  end

  def new_from_filename(songname)
    array = songname.split(" - ")
    song = self.find_or_create_by_name(array[1])
    song.artist = Artist.find_or_create_by_name(array[0])
    song.genre = Genre.find_or_create_by_name(array[2].split(".")[0])
    song
  end
  ##module ClassMethods
  def find_by_name(name)
  self.all.detect{|element| element.name == name}
  end

  def find_or_create_by_name(name)
  obj = self.all.detect{|element| element.name == name}
  if obj == nil
    obj = self.new(name)
  end
  ##binding.pry
  obj
end
end
