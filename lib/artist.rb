class Artist
  attr_accessor :name, :songs

  @@all=[]

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
    artist = Artist.new(name)
    artist.save
    artist
    # binding.pry
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

end
