class Genre
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    #@artist = artist
    #@genre = genre
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(genre_name)
    genre = Genre.new(genre_name)
    genre.save
    genre
  end

  def artists
      @songs.collect {|x| x.artist}.uniq
      #self.songs.collect {|x| x.artist}.uniq
  end

  def add_songs(song)
    @songs << song
    song.genre = self
  end


end
