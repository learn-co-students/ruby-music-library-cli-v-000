class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs # I forgot to include :songs, which no makes the #songs method I wrote unnecessary.

  @@all = []

  def initialize(name)
    @name = name
    @songs = [] # has_many songs interface
  end

  def add_song(song) # has_many songs interface
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  # def songs # has_many songs interface
  #   @songs
  # end

  def save
    @@all << self
  end

  def genres
    self.songs.map { |s| s.genre }.uniq
  end

  def self.create(name)
    # artist = self.new(name)
    # artist.save
    # artist
    new(name).tap { |a| a.save }
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end