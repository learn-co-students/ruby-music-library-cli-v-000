class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
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
      new_song.genre = self
    end
  end

  def artists
    @songs.map { |song| song.artist }.uniq
  end
end
