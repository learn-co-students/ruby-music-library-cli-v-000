class Song
  extend Concerns::Findable
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  ## initializes with a song's name
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end # initialize


  ## returns the @@all array
  ## to minimize amount of locations to change @@all variable name

  def self.all
    @@all
  end # self.all

  ###################################################################
  ###### artist.rb, genre.rb, song.rb code differs here on out ######
  ###################################################################

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end # artist=

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end # genre=

  def self.new_from_filename(filename)
    split_filename = filename.gsub('.mp3','').split(' - ')
    new_song = self.find_or_create_by_name(split_filename[1])
    new_song.artist = Artist.find_or_create_by_name(split_filename[0])
    new_song.genre = Genre.find_or_create_by_name(split_filename[2])
    new_song
  end # .new_from_filename

  def self.create_from_filename(filename)
      self.new_from_filename(filename)
  end # .create_from_filename


end # class Song
