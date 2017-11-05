class Genre
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
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def add_song(song)
    if song.artist == nil
    song.artist = self
  end
  if self.songs.include?(song) == false
     self.songs << song
   end
  end

  def artists
    new_array = []
    self.songs.collect do |song|
      new_array << song.artist
    end
    new_array.uniq
  end

end
