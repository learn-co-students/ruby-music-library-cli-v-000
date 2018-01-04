class Genre
@@all = []
attr_accessor :name, :artist
attr_reader :songs
extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs  = []
  end

  def songs
    @songs
  end

  def artists
    @songs.collect{|a| a.artist}.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    song.genre = self unless song.genre
    songs << song unless songs.include?(song)
  end

  def save
    @@all << self
  end

  def self.create(name)
    g = self.new(name)
    g.save
    g
  end


end
