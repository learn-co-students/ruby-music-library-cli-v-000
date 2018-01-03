class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @@all = []
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

  def self.create(created_song)
    @@all << created_song
    created_song
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

    def genres
      unique = []

      songs.map do |song|
        if !unique.include?(song.genre)
          unique << song.genre
        end
      end
      unique
    end
  end

  def songs
    @songs
  end

end
