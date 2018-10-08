class Artist

  attr_accessor :name
  @@all = Array.new

  def initialize(name)
    @name = name
    @songs = Array.new
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
      if @songs.include?(song) == false
        @songs << song
      end
    end
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
    new_artist = Artist.new(name)
    @@all << new_artist
    new_artist
  end
end
