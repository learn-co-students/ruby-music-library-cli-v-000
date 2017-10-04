class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
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
    temp_array = []
    @songs.each do |song|
      if !temp_array.include?(song.genre)
        temp_array << song.genre
      end
    end
    temp_array
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    created_song = Artist.new(name)
  end

end
