class Genre
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

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

  def songs
    @songs
  end

  def add_song(song)
    #doesnt add the song to the current artist's collection of songs if it already exists within.
    exists = @songs.detect {|x| x == song }
    if exists == nil
      @songs << song  #adds a song object to the songs array within this artist instance.
    end

    if song.genre == nil
      song.genre = self
    end
  end

  def artists
    all_artists = []
    @songs.each do |song|
      all_artists << song.artist
    end
    unique_artists = all_artists.uniq
    unique_artists
  end

end
