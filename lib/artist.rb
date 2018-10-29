class Artist
  attr_accessor :name, :songs
  @@all = []

  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    #@songs << song
    song.artist = self unless song.artist == self
    if @songs.include?(song)
    else
      @songs << song
    end
  end

  def songs
    @songs
  end

  def genres
    songs.map(&:genre).uniq
  end

  def self.find_by_name(name)
    @@all.detect {|artist| artist.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      Artist.find_by_name(name)
    else
      self.create(name)
    end
  end
end
