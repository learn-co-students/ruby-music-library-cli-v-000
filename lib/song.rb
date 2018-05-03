class Song
  attr_accessor :name
  attr_accessor :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist      # optional second argument assigned to the song's artist property
    @genre = genre
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def self.create(name)   #initializes and saves the song
    song = new(name)
    song.save
    song
  end
  def self.find_by_name(name)
    @@all.detect { |s| s.name = name }
  end
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def save                # adds the Song instance to the @@all class variable
    @@all << self
  end

end
