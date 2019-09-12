class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
  end

  def add_song(song)
    if songs.include?(song) == false
      songs << song
    end
    if song.genre == nil
      song.genre = self
    end
  end

  def artists
    songs.collect do |song|
      song.artist
    end.uniq
  end
end
