class Genre
attr_accessor :name
attr_reader :songs

extend Concerns::Findable


@@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    # new(name).tap{ |g| g.save }
    genre = Genre.new(name)
    genre.save
    genre
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.genre = self unless song.genre
    @songs << song unless @songs.include?(song)
  end

  def artists
    genre_artists = self.songs.collect do | song |
      song.artist
    end
    genre_artists.uniq
  end

end
