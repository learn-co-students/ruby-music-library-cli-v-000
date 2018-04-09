class Artist
  attr_accessor :songs, :name
  @@all = []

def initialize(name)
  self.songs = []
  @name = name
  save
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
    new_artist = self.new(name)
    new_artist.save
    new_artist
    end

    def add_song(song)
      if song.artist != self
        song.artist = self
      if !@songs.include?(song)
          @songs << song
        end
    end
  end

  def genres
    @genres = []
    self.songs.each do |song|
      @genres << song.genre
    end
  end
end
