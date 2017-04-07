require 'pry'

class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files # method stores files (without path) in @files variable as an array
    @files = Dir["#{path}/*.mp3"].collect do |file|
      File.basename(file)
      #binding.pry
    end
    binding.pry
  end

  def import
    files.each do |file_name|
      Song.create_from_filename(file_name)
    end
  end
end

#--------------------  SONG CLASS  ------------------------

class Song
  attr_accessor :name, :artist, :genre, :songs
  @@all = []

  def initialize(name, artist = nil, genre = nil) # optional artist and genre arguments
    @name = name
    self.artist = artist if artist != nil # if artist provided then assign artist to song
    self.genre = genre if genre != nil # if genre provided then assign genre to song
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

  def self.create(name, artist = nil, genre = nil) # include artist and genre if known
    #if artist.songs.include?(name) == false
      self.new(name, artist, genre).tap do |s| # taps new instance without conflict with song.name
        s.save  # song instance is added to @@all array
      #if @@all.include?(s) == false
      #  s.save
      end
      #binding.pry
    #end
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      if song.name == name
        puts "The song '#{name}' you are trying to find and/or create currently exists in the music library."
      end
    end
    # finds an instance in @@all by the name property of the song
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  # finds or creates a song by name maintaining uniqueness of objects by their name property

  def artist=(artist) # artist setter within Song instance
    @artist = artist
    #if artist.songs.include?(self.name) == false
      artist.add_song(self) # adds the song to the artist's songs
    #end
    #binding.pry
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
    #adds genre to songs array if genre does not exist
    #genre.songs << self unless genre.songs.include?(self)
    #binding.pry
  end

  def to_s # convert to string
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end
end

#--------------------  ARTIST CLASS  ------------------------

class Artist
  attr_accessor :name, :songs, :genre
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  # #.tap method yields self to the block, and then returns self. The primary purpose of this method is to
  # “tap into” a method chain, in order to perform operations on intermediate results within the chain.

  def self.create(name)
    self.new(name).tap do |artist| # taps into new Artist instance without conflict with artist.name
      artist.save  # artist instance is added to @@all array
      #binding.pry
    end
  end

  def self.find_by_name(name)
    self.all.detect do |artist|
      if artist.name == name
        puts "The artist '#{name}' you are trying to find and/or create currently exists in the music library."
      end
    end
    # finds an instance in @@all by the name property of the artist
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  # finds or creates a artist by name maintaining uniqueness of objects by their name property

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    # Tells a song that it belongs to an artist. This should happen when that song is added to
    # the artist's @songs collection, unless song already has the artist.
    if @songs.include?(song) == false
      @songs << song
    end
    #@songs << song unless @songs.include?(song)
    #end
    # Add song to artist's @songs collection, unless song is already in artist's collection
    #binding.pry
  end

  def save
    self.class.all << self
  end

  def to_s
    self.name
  end

  def self.songs
    @songs
  end
end

#--------------------  GENRE CLASS  ------------------------

class Genre
  attr_accessor :name, :songs, :artist
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  # #.tap method yields self to the block, and then returns self. The primary purpose of this method is to
  # “tap into” a method chain, in order to perform operations on intermediate results within the chain.

  def self.create(name)
    self.new(name).tap do |genre| # taps new instance without conflict with genre.name
      genre.save  # genre instance is added to @@all array
      #binding.pry
    end
  end

  def self.find_by_name(name)
    self.all.detect do |genre|
      if genre.name == name
        puts "The genre '#{name}' you are trying to find and/or create currently exists in the music library."
      end
    end
    # finds an instance in @@all by the name property of the genre
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  # finds or creates a genre by name maintaining uniqueness of objects by their name property

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def to_s
    self.name
  end
end


##------------------------  TEST CODE  --------------------------
test_music_path = "./spec/fixtures/mp3s"
#music_path = "./db/mp3s"
music_importer = MusicImporter.new(test_music_path)
music_importer.files
#music_importer.import

christian = Genre.create("christian")
jazz = Genre.create("jazz")
rock = Genre.create("rock")

casting_crowns = Artist.create("Casting Crowns")
david_sanborn = Artist.create("David Sanborn")
boston = Artist.create("Boston")

voice_of_truth = Song.create("Voice of Truth", casting_crowns, christian)
chicago_song = Song.create("Chicago Song", david_sanborn, jazz)
dont_look_back = Song.create("Don't Look Back", boston, rock)
more_than_a_feeling = Song.create("More Than A Feeling", boston, rock)
who_am_i = Song.create("Who Am I", casting_crowns, christian)

song = Song.find_or_create_by_name("At Your Feet")
at_your_feet = Song.create("At Your Feet", casting_crowns, christian)

#song = Song.find_or_create_by_name("Chicago Song")
#artist = Artist.find_or_create_by_name("Casting Crowns")
#genre = Genre.find_or_create_by_name("christian")
genre = Genre.find_or_create_by_name("jazz")

puts casting_crowns.songs # artist has many songs
puts david_sanborn.songs
puts boston.songs

puts voice_of_truth.genre # song has genre
puts more_than_a_feeling.genre

puts who_am_i.artist # song belongs to artist
puts chicago_song.artist
