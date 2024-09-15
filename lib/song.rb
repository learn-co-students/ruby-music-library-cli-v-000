class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
   def initialize(name, artist = nil, genre = nil)
    @name = name
    artist ? self.artist = artist : nil
    genre ? self.genre = genre : nil
  end
   def self.all
    @@all
  end
   def save
    @@all << self
  end
   def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
   def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
   def self.destroy_all
    self.all.clear
  end
   def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
   def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end
   def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
   def self.new_from_filename(filename)
    pieces = filename.split(" - ")
    artist_name, song_name, genre_name = pieces[0], pieces[1], pieces[2].gsub(".mp3", "")
     artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
     Song.new(song_name, artist, genre)
  end
   def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end
end