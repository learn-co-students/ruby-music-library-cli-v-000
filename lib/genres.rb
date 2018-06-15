class Genre
extend Concerns::Findable
  @@all = []

  attr_accessor :name, :songs, :artist

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def add_song(song)

    if song.genre == nil
      song.genre=self
    end
    if ! @songs.include?(song)
      @songs << song
    end
    #binding pry
  end

  def artists
    artists = []
    @songs.each do |song|
      artists << song.artist
    end
    artists.uniq
  end

end
