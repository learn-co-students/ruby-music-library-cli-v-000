class Artist

  attr_accessor :name, :songs

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song_name)
    song = song_name
    if song.artist == nil
      song.artist = self
    end
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.map do |song|
      song.genre
    end.uniq
  end

end
