class Song
  #attributes & variables
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = Array.new

  #Modules
  extend Concerns::Findable

  #initialize
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  #class methods
  def self.all
    @@all
  end

  def self.create(name, artist = nil, genre = nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end

  def self.new_from_filename(filename)
    song_info = filename.split(" - ")

    song_artist = Artist.find_or_create_by_name(song_info[0])
    song_name = song_info[1]
    song_genre = Genre.find_or_create_by_name(song_info[2].gsub(".mp3", ""))

    self.new(song_name, song_artist, song_genre)
  end

  def self.create_from_filename(filename)
    song_info = filename.split(" - ")

    song_artist = Artist.find_or_create_by_name(song_info[0])
    song_name = song_info[1]
    song_genre = Genre.find_or_create_by_name(song_info[2].gsub(".mp3", ""))

    self.create(song_name, song_artist, song_genre)
  end

  def self.destroy_all
    self.all.clear
  end

  #instance methods
  def save
    self.class.all.push(self) unless self.class.all.include?(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

end
