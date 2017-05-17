class Artist

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

  def add_song(song)
    if !self.songs.include?(song)
      @songs << song
    end
    if song.artist == nil
      song.artist = self
    end
  end

  def save
    @@all << self
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def genres
    unique = []
    @songs.each do |e|
      if !unique.include?(e.genre)
        unique << e.genre
      end
    end
    unique
  end


end
