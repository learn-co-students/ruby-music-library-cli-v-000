class Genre

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
    # binding.pry
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    s = new(name)
    s.save
    s
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre == self
    song
  end

  def artists
    artists = @songs.collect do |song|
      song.artist
    end
    artists.uniq
  end

end
