class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.create(artist)
    self.new(artist).tap {|name|
    name.save}
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def genres #returns a collection of genres for all of the artist's songs (artist has many genres through songs)
    #does not return duplicate genres if the artist has more than one song of a particular genre (artist has many genres through songs)
    #collects genres through its songs instead of maintaining its own @genres instance variable (artist has many genres through songs)
    self.songs.collect do |song|
      song.genre
    end.uniq
  end
end
