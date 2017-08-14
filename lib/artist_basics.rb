class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs
  #, :artist I do not need this. why not?
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear

    # better to do this than to just set to an empty array
  end

  def save
    @@all << self
  end

  def self.create(song) #maybe syntactically better to have 'name' argument

    # more concise:
    #new(name).tap{|a| a.save}
    artist = Artist.new(song)
    artist.save
    artist
  end

  def songs #this is not in solution file; why?
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless self.songs.include?(song)
  end

  def genres
      genre_array = self.songs.collect { |song| song.genre }
      genre_array.uniq
  end

end
