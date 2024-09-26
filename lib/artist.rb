class Artist
  extend Concerns::Findable

  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    @songs.collect{|song| song.genre}.uniq
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
      song.artist = self
    end
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    instance = self.new(name).tap{|s| s.save}
  end
end