class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    #self.save
  end

  def genre=(genre)
    @genre=genre
    genre.add_song(self) if !genre.songs.detect {|i| i == self}
  end

  def artist=(artist)
    @artist=artist
    artist.add_song(self) #if artist.songs.detect {|song| song == self.name} == nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all=[]
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end


  def self.find_by_name(name)
    @@all.detect {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(path_name)
    splitter = []
    splitter = path_name.split(/ - /)
    artist_name = splitter[0].strip # if !@@all.detect {|song| song.artist == artist}
    name = splitter[1].strip
    genre_name = splitter[2].strip.gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(name, artist, genre)
  end

  def self.create_from_filename(path_name)
    song = new_from_filename(path_name)
    song.save
    song

  end

end
