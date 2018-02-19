class Artist
  extend Concerns::Findable

   attr_accessor :name, :songs
  # attr_reader :songs

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
    #self.new(name).save[0]
    artist = new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
    genre_array = []
    self.songs.collect do |song|
      genre_array << song.genre unless genre_array.include?(song.genre)
    end
    genre_array
  end
    #songs.collect{ |s| s.genre }.uniq
  #end
end
