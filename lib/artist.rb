class Artist
  extend Concerns::Findable
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
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end


  def add_song(song)
    if self.songs.include?(song)
      self.songs
    else
      self.songs << song
    end

    if song.artist == nil
      song.artist = self
    end
 end

    def genres
      unique = []

      songs.map do |song|
        if !unique.include?(song.genre)
          unique << song.genre
        end
      end
      unique
    end

  def songs
    @songs
  end

end
