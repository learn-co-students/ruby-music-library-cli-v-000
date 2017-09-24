class Artist
  extend Concerns::Findable

  attr_accessor :name, :song

  @@all = []

  def initialize(name, song = "")
    @name = name
    @song = song
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

  def self.create(name, song = "")
    new(name, song).tap { |artist| artist.save}
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end

    if !@songs.include?(song)
      @songs << song
    end
  end

  def genres
    genres = []
    @songs.each do |song|
      genres << song.genre
    end
    genres.uniq
  end

end
