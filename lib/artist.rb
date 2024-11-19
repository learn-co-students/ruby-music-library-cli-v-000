class Artist

extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

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

  def self.create(artist)
    new_artist = self.new(artist)
    new_artist.save
    new_artist
  end

  def songs
    return @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !@songs.include?(song)
        @songs << song
    end

  end

def genres
#iterate over songs. take the genre from each song. put into array. return array
  genres = []
  @songs.each do |song|
    if !genres.include?(song.genre)
      genres << song.genre
    end
  end
  return genres

end


end
