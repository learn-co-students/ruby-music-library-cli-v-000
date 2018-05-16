class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
  end
  
  def self.new_from_filename(file_name)
    song_name = file_name.split(" - ")[1]
    artist_name = file_name.split(" - ")[0]
    genre_name = file_name.split(" - ")[2].split(".")[0]
    artist_name = Artist.find_or_create_by_name(artist_name)
    genre_name = Genre.find_or_create_by_name(genre_name)
    new_instance = self.new(song_name, artist_name, genre_name)
    new_instance
  end
  
  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create(song_name)
    end
  end
  
  def self.find_by_name(song_name)
    @@all.detect {|i| i.name == song_name}
  end
  
  def genre=(genre_name)
    @genre = genre_name
    if genre_name.songs.include?(self) == false
      genre_name.songs << self
    end
  end 
  
  def artist=(artist_name)
    @artist = artist_name
    self.artist.add_song(self)
  end
  
  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.all
    @@all
  end
end