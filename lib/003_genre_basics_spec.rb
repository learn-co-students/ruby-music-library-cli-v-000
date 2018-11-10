class Genre

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    if !song.genre
      song.genre = self
    end
    if @songs.include?(song) == false
      @songs << song
    end
  end

  def artists
    songs.map {|s| s.artist}.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

end
