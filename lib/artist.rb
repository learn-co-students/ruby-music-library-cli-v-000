class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    genres = @songs.collect {|song| song.genre}
    genres.uniq
  end

  def save
    self.class.all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = Artist.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end
end
