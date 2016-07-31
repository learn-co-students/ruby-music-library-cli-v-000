class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
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
    @@all << self
  end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|s| s.save}
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

  def self.find_by_name(name)
    self.all.detect{|a| a.name == name}
  end

  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
      holder_array = filename.split(" - ")
      artist, song, genre = holder_array[0], holder_array[1], holder_array[2].gsub(".mp3", "")

     new_artist = Artist.find_or_create_by_name(artist)
     new_genre = Genre.find_or_create_by_name(genre)
     self.new(song, artist, genre)
  end

  def self.create_from_filename(filename)
      holder_array = filename.split(" - ")
      artist, song, genre = holder_array[0], holder_array[1], holder_array[2].gsub(".mp3", "")

     new_artist = Artist.find_or_create_by_name(artist)
     new_genre = Genre.find_or_create_by_name(genre)
     self.create(song, artist, genre)
  end

end
