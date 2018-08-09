class Genre
  extend Concerns::Findable

  @@all = []

  attr_accessor :name
  attr_reader :songs


  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def add_song(song)
    if song.genre != self
      song.genre = self
    end
    if @songs.include?(song) != true
      @songs << song
    end
  end

  def artists
    artists = @songs.collect do |song|
      song.artist
    end
    artists.uniq
  end

end
