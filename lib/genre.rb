class Genre
  attr_accessor :name, :songs, :artists
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @artists = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    created_genre = Genre.new(name)
    created_genre.save
    created_genre
  end

  def artists=(artists)
    @artists = artists

    self.songs.select do |each_song|
      @artists << each_song.artist
    end

  end

end
