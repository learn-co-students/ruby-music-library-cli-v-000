class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []  # stores song instances

  def initialize(name, artist = nil, genre = nil)  # artist instance
    @name = name
    self.artist = artist if artist #!= nil  # self is the song instance; calls artist= method, passing the artist instance as argument if that argument is not nil
    self.genre = genre if genre #!= nil  # self is the song instance; calls genre= method, passing the genre instance as argument if that argument is not nil
  end

  def self.create(name, artist=nil, genre=nil)  # self is the class
    song = self.new(name,artist,genre)  # self is the class; creates a new song instance and stores in variable song
    song.save  # calls the save method on the song instance
    song  # returns song instance
  end

  def self.all  # self is the Song class; returns the array of all song instances
    @@all
  end

  def self.new_from_filename(filename)  # self is the Song class
    artist, song, genre = filename.gsub(".mp3","").split(" - ")  # parses filename and uses multiple assignment to assign artist, song, and genre variables
    new_song = self.new(song)  # self is the Song class; creates a new song instance and stores in variable new_song
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song.genre = Genre.find_or_create_by_name(genre)
    new_song
  end

  def self.create_from_filename(filename)  # self is the Song class
    artist, song, genre = filename.gsub(".mp3","").split(" - ")  # parses filename and uses multiple assignment to assign artist, song, and genre variables
    new_song = self.create(song)  # self is the Song class; creates a new song instance and stores in variable new_song
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song.genre = Genre.find_or_create_by_name(genre)
    new_song
  end

  def self.destroy_all  # self is the class
    self.all.clear  # calls clear on the @@all array
  end

  def save
    @@all << self  # self is the song instance; adds the song instance to the @@all array
  end

  def artist=(artist)  # artist instance
    @artist = artist
    artist.add_song(self)  # self is the song instance
  end

  def genre=(genre)  # genre instance
    @genre = genre
    unless genre.songs.include?(self)  # self is the song instance; checks if the song instance is present in the songs array for the genre instance
      genre.songs << self  # self is the song instance; adds the songs instance to the songs array for the genre instance
    end
  end

  def fullname
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"  # self is the song instance
  end

end