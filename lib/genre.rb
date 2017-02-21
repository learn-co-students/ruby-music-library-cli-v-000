class Genre
  extend Concerns::Findable

  attr_accessor :name, :song, :artist
  @@all=[]

  def initialize(name, artist=nil, genre=nil)
    @name=name
    @songs=[]
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

  def self.create(name, artist=nil, genre=nil)
    new(name, artist, genre).tap {|a| a.save}
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end

  def artists
    self.songs.collect {|s| s.artist}.uniq
  end

  def genre=(genre)
    @genre=genre
    genre.songs << self unless genre.songs include?(self)
end


end
