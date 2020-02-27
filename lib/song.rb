class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    
    if genre != nil
      self.genre=(genre)
    end
  end

  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    if !genre.songs.include? self
      genre.add_song(self)
    end
  end
  
  def self.new_from_filename(file)
    parse_file = file.split(" - ")
    n = parse_file[1]
    g = parse_file[2].chomp('.mp3')
    a = parse_file[0]
  
    artist = Artist.find_or_create_by_name(a)
    genre = Genre.find_or_create_by_name(g)
    song = self.new(n, artist, genre)
    song.save
    song

  end
  
  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end
end
