class Artist
  extend Concerns::Findable
  attr_accessor :name, :song, :songs
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
  end

  def save
    @@all << self
  end

  def self.create(name)
    new(name).tap(&:save)
  end

  def add_song(new_song)
    if !@songs.include?(new_song)
      @songs << new_song
      new_song.artist = self
    end
  end

  def genres
    @songs.map { |song| song.genre }.uniq
  end
end
