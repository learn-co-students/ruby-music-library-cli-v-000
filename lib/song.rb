class Song
  extend Concerns::Findable #Take all of methods in Findable module and add as class methods
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  extend Nameable::ClassMethods

  attr_accessor :name
  attr_reader :genre, :artist

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    #@artist = artist
    if artist != nil
      artist.add_song(self)
    else
      @artist = nil
    end
    if genre != nil
      genre.add_song(self)
    else
    @genre = genre
    end
  end

  def self.all
    @@all
  end

  def self.create(name, artist=nil, genre=nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end

  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self)
    @genre = genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.new_from_filename(file_name)
    x = file_name.split(" - ")
    name = x[1]
    artist = x[0]
    genre = x[2].chomp(".mp3")
    song = self.find_or_create_by_name(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(file_name)
      song = self.new_from_filename(file_name)
      song.save
  end

end
