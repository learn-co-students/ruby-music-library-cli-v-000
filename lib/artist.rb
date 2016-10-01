class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []

    self.save
  end

  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    end

    unless song.artist == self
      song.artist = self
    end
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end

  def name
    @name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    artist = self.new(name)
    self.all << artist
    artist
  end

  def self.destroy_all
    @@all.clear
  end

end
