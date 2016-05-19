class Artist
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

  def add_song(new_song)
    @songs.include?(new_song) ? () : (@songs << new_song)
    new_song.artist = self unless new_song.artist == self
  end

  def genres
    gen = []
    @songs.each {|instance| gen << instance.genre unless gen.include?(instance.genre) == true}
    gen
  end
end