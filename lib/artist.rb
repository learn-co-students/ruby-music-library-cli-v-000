class Artist
  attr_accessor :name, :songs
  @@all = []
  extend Concerns::Findable

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
    artist = Artist.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist.nil?
      song.artist = self
      @songs << song
    end
  end

  def genres
     genres = []
     @songs.each do |song|
        genres << song.genre
     end
     genres.uniq
   end



end
