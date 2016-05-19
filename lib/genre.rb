class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
    @@all = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_song = self.new(name)
    @@all << new_song
    new_song
  end

  def artists
    art = []
    @songs.each {|instance| art << instance.artist unless art.include?(instance.artist) == true}
    art
  end
end