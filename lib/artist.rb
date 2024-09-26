class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  attr_writer :artist
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
    end

    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end

end
