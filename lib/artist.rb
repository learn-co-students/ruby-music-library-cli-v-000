class Artist
  @@all = []

  extend Concerns::Findable
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def save
    @@all << self
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    if !song.artist
      song.artist = self
    end
  end

  def genres
    collection = []
    @songs.each do |song|
      collection << song.genre
    end
    collection.uniq
  end


end