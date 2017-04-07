require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil) # optional artist and genre arguments
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
    #binding.pry
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  ## Song class parses file_name, variables are assigned song, artist and genre and also
  ## creates instances. These methods collaborate with Artist and Genre classes by assigning
  ## Artist and Genre what is produced by the #find_or_create_by_name(name) method

  def self.new_from_filename(file_name) # file_name argument from MusicImporter Class
    artist_name = file_name.split(" - ")[0] # artist name equals file_name index[0]
    song_name = file_name.split(" - ")[1] # song name equals file_name index[1]
    genre_name = file_name.split(" - ")[2].gsub(".mp3", "") # genre name equals file_name index[2] minus ".mp3" extension

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre) # create new instances
    #binding.pry
  end

  def self.create_from_filename(file_name) # file_name argument from MusicImporter Class
    artist_name = file_name.split(" - ")[0] # artist name equals file_name index[0]
    song_name = file_name.split(" - ")[1] # song name equals file_name index[1]
    genre_name = file_name.split(" - ")[2].gsub(".mp3", "") # genre name equals file_name index[2] minus ".mp3" extension

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
    #binding.pry
  end

  # #.tap method yields self to the block, and then returns self. The primary purpose of this method is to
  # “tap into” a method chain, in order to perform operations on intermediate results within the chain.

  def self.create(name, artist = nil, genre = nil)
    self.new(name, artist, genre).tap do |s| # taps new instance without conflict with song.name
      s.save  # song instance is added to @@all array through #save method
      #binding.pry
    end
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
    # finds an instance in @@all by the name property of the song
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  # finds or creates a song by name maintaining uniqueness of objects by their name property

  def artist=(artist)
    @artist = artist
    artist.add_song(self) # adds the song to the artist's songs
    #binding.pry
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
    #adds genre to @songs array if genre does not exist
    #binding.pry
  end

  def to_s # convert to string
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end
end


#casting_crowns = Artist.create("Casting Crowns")
#song = Song.create("Voice of Truth", casting_crowns)
#puts song.name
