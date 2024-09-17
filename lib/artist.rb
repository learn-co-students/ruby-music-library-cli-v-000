class Artist
  attr_accessor :name, :songs, :artist, :genre

  extend Concerns::Findable
  @@all = []


  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    @name = Artist.new(name)
    @@all << @name
    @name
  end

  def add_song(song)
    if !song.artist
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end

  def genres
    @genre = []
    @songs.each do |song|
        if !@genre.include?(song.genre)
          @genre << song.genre
        end
    end
    @genre
  end
end
