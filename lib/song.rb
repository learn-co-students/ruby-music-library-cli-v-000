class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    @@all = []
  end
  def artist=(artist)
     @artist = artist
     artist.add_song(self)
   end

   def genre=(genre)
     @genre = genre
     genre.songs << self unless genre.songs.include?(self)
   end
  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_by_name(name)
  song = Song.new
  song.name = name
  song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name = name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end


end
