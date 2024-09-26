class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song|
      song.name == name
    }
  end

  def self.new_from_filename(filename)
    artist_name_genre = filename.split(' - ').collect {|word| word.gsub('.mp3', "")}

    artist = Artist.find_or_create_by_name(artist_name_genre[0])
    genre = Genre.find_or_create_by_name(artist_name_genre[2])

    self.new(artist_name_genre[1], artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist.class == Artist
    self.genre = genre if genre.class == Genre
  end

  def save
    self.class.all << self if !self.class.all.include?(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

end
