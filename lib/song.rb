require 'pry'

class Song

  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil # invokes artist= instead of @artist variable upon initialize if artist given
    self.genre = genre unless genre == nil # invokes genre= instead of @genre variable upon initialize if genre given
  end

  def self.all #retrieves class variable @@all
    @@all
  end

  def self.destroy_all #resets/clears class variable @@all to empty array
    @@all.clear
  end

  def save #saves song instance to class variable @@all
    @@all << self
  end

  def self.create (name)
    new(name).tap {|s| s.save}
    # new_song = Song.new(song, artist, genre)

    # song = new(name)
    # song.save
    # return song
  end

  def artist=(artist) # invokes artist and adds itself to artist song collection
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self) #adds song to genre song collection unless song previous included
  end

  def self.find_by_name (song) # finds song instance in @@all by song name
    self.all.detect {|s| s.name == song}
  end

  def self.find_or_create_by_name (song)
    find_by_name(song) || create(song)
  end

  def self.new_from_filename(filename) #initializes song based on passed-in filename
    title = filename.split(' - ')
    artist = Artist.find_or_create_by_name(title[0])
    genre = Genre.find_or_create_by_name(title[2][0..-5])
    new(title[1], artist, genre)
  end

  def self.create_from_filename (filename) # initializes and saves a song based on passed-in filename
    new_from_filename(filename).save
  end
   

end
