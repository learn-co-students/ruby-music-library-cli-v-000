module Concerns::Findable
  def find_by_name(name)
    self.all.detect{|item| item.name == name}
  end

  def new_by_name(name)
    self.new(name)
  end

  def find_or_create_by_name(name)
    self.name != name
    self.find_by_name(name) ? self.find_by_name(name) : self.new_by_name(name).tap{|s| s.save}
  end
end

def new_from_filename(file)
  file = file.split(" - ")
  artist = file[0]
  song = file[1]
  genre = file[2].gsub(".mp3", "")
  new_song = self.new_by_name(song)
  new_song.artist = Artist.find_or_create_by_name(artist)

  new_song.artist.add_song(new_song)
  new_song.genre = Genre.find_or_create_by_name(genre)
  new_song.genre.add_song(new_song)
  new_song #want to use tap here
end

def create_from_filename(file)
  self.new_from_filename(file).tap{|s| s.save}
end
