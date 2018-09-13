class Song
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
  end

  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    self.class.all << self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end
  
  def add_song
    self.artist.add_song
  end
  
  def self.find_by_name(name)
    self.all.find { |s| s.name == name }
  end
  
  def self.create(name)
    self.new(name).tap { |s| s.save }
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    new_song = filename.split(" - ")
    a = new_song[0]
    g = new_song[2].chomp('.mp3')
    song = new_song[1]
    artist = Artist.find_or_create_by_name(a)
    genre = Genre.find_or_create_by_name(g)
    new(song, artist, genre)
  end
  
  def self.create_from_filename(filename)
    @@all << new_from_filename(filename)
  end
end
