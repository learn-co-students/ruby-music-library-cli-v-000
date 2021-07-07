class Genre
  extend Concerns::Findable
attr_accessor :name, :artist, :genre
attr_reader :songs
  
  def initialize(name)
    @name = name
    @songs = []
    # if artist != nil
    #   self.artist = artist
    # end
    # if genre != nil
    #   self.genre = genre
    # end
    save
  end
  
  @@all = []
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end

  def self.create(genre_name)
    genre = new(genre_name)
    genre.save
    genre
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    songs.push song unless songs.include?(song)
  end
  def artists
    songs.map(&:artist).uniq
  end
end