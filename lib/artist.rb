class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @songs = []
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist

    # Could be done on one line:
    # self.new(name).tap{|a| a.save}
  end

  def add_song(song)
    if !self.songs.include?(song)
      self.songs << song
    end

    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

  def self.alpha_artists
    @@alpha_artists = self.all.sort {|a, b| a.name <=> b.name}
  end
end
