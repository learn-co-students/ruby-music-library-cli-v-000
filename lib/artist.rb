class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genres

  @@all = []

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

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if !(@songs.include?(song))
      @songs << song
      song.artist = self
    end
  end

  def genres
    gen = []
    @songs.each do |song|
      unless gen.include?(song.genre)
        gen << song.genre
      end
    end
    gen
  end


end
