class Genre
  extend Concerns::Findable
  attr_accessor :songs, :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end


  def self.destroy_all
    @@all = []
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
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre != nil
  end

  def artists
    artists = []
    @songs.each do |song|
      artists << song.artist
    end
    artists.uniq
  end

end
