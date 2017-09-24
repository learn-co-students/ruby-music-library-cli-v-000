class Song
  
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist.add_song(self) if artist
    genre.add_song(self) if genre
    # self.artist = artist unless self.genre == artist
    # self.genre = genre unless self.genre == genre
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self unless @@all.include?(self)
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
    
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end  
  
  def self.new_from_filename(filename)
    split_up = filename.gsub(".mp3", "").split(" - ")
    artist = split_up[0]
    song_name = split_up[1]
    genre = split_up[2]
    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end
  
  def self.create_from_filename(filename)
    split_up = filename.gsub(".mp3", "").split(" - ")
    artist = split_up[0]
    song_name = split_up[1]
    genre = split_up[2]
    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end