class Song
extend Concerns::Findable

attr_accessor :name
attr_reader :artist, :genre

@@all = []

def initialize(name, artist = nil, genre = nil)
  @name = name
  if artist != nil
      if artist.is_a?(String)
        self.artist_name=(artist)
      else
      self.artist=(artist)
      end
    end
  if genre != nil
    if genre.is_a?(String)
      self.genre_name=(genre)
    else
      self.genre=(genre)
    end
  end
end

def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

def genre=(genre)
  @genre = genre
  genre.add_song(self)
end

def self.all
@@all
end

def save
  @@all << self
end

def self.destroy_all
  @@all.clear
end

def self.create(name)
  new_song = Song.new(name)
  new_song.save
  new_song
end

def artist_name=(artist_name)
  self.artist = Artist.find_or_create_by_name(artist_name)
end

def genre_name=(genre_name)
  self.genre = Genre.find_or_create_by_name(genre_name)
end

def self.new_from_filename(file_name)
  array = file_name.chomp!(".mp3").split(" - ")
  artist_name = array[0]
  song_name = array[1]
  genre_name = array[2]
  song = self.new(song_name, artist_name, genre_name)
end

def self.create_from_filename(file_name)
  new_song = self.new_from_filename(file_name)
  new_song.save
  new_song
end

end
