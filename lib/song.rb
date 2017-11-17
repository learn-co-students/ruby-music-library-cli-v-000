require('pry')
class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre = genre
    end
    @@all << self
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

  def self.create(name)
    # binding.pry
    song = Song.new(name)
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
    # binding.pry
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(song)
    @@all.detect{|s| s.name == song}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      Song.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(name)
    file = name.split(" - ")
    song = Song.find_or_create_by_name(file[1])
    song.artist = Artist.find_or_create_by_name(file[0])
    song.genre = Genre.find_or_create_by_name(file[2].chomp(".mp3"))
    # binding.pry
    song
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    song
  end

end
