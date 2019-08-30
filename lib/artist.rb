class Artist
  extend Concerns::Findable
  extend Concerns::Printable

  attr_accessor :name, :songs

  @@all = [] # holds all of the artists created

  # INSTANCE METHODS
  def initialize(name)
    @name = name
    @songs = []
  end

  def save
   Artist.all << self
  end

  def add_song(song)
    self.songs.include?(song) ? return : self.songs << song
    song.artist == nil ? song.artist = self : return
  end

  def genres
    (@songs.collect do |song|
      song.genre
    end).uniq
  end

  # CLASS METHODS
  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    Artist.all.clear
  end
end
