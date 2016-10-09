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
  end

  def add_song(song)
    if song.genre != nil
      genre = song.genre
    else
      genre = self
    end
    if song.genre != genre
      song.genre = genre
    end
    if genre.songs.include?(song)
      return
    else
      genre.songs << song
    end
  end

  def artists
    array = self.songs.collect{|song|song.artist}
    array.uniq!
    array
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

end
