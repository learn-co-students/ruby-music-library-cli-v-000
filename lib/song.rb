class Song  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = "", genre = "")
    @name = name
    artist.add_song(self) unless artist == ""
    genre.add_song(self) unless genre == ""
  end
  
  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.create(song)
    new_song = Song.new(song)
    new_song.save
    new_song
  end
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
    self
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
    self
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else self.find_by_name(name)
    end
  end
  
  def self.new_from_filename(filename)
    artist_string = filename.split(" - ")[0]
    song_string = filename.split(" - ")[1]
    genre_string = filename.split(" - ")[2].chomp(".mp3")
    song = self.new(song_string)
    song.artist = Artist.find_or_create_by_name(artist_string)
    song.genre = Genre.find_or_create_by_name(genre_string)
    song
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
end