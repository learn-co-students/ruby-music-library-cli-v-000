class Genre
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

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def add_song(song)
    if self.songs.include?(song)
    else
      self.songs << song
    end
    if song.genre.nil?
      song.genre = self
    end
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def artists
    every_artist = self.songs.collect {|song| song.artist}
    every_artist.uniq
  end

end
