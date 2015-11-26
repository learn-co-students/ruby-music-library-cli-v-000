class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
    @@all << self
  end

  def self.all
    @@all 
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(string)
    new_song = Song.new(string)
  end

  def artist_name
    self.artist.name
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(song)
    self.all.detect {|song| song.name = song}
  end
 
  def self.find_or_create_by_name(song)
    self.all.each {|song| return song if song.name = song}
    self.create(song) 
  end

end



####
