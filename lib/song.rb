
class Song
  attr_accessor :name, :artist, :genre

  extend Concerns::Findable
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist!= nil
      self.artist = artist
    end
    if genre!=nil
      self.genre = genre
    end
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    @name = Song.new(name)
    @@all << @name
    @name
  end

  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre= (genre)
    @genre = genre
    if !@genre.songs.include?(self)
      @genre.songs << self
    end
  end

  def self.new_from_filename(file)
    entry = file.split(" - ")

    song = Song.new(entry[1])
    artist = Artist.find_or_create_by_name(entry[0])
    song.artist = artist
    # artist.add_song(song)
    genre = entry[2].split(".")

    genre =  Genre.find_or_create_by_name(genre[0])
    song.genre = genre
    genre.songs << song

    song
  end

  def self.create_from_filename(file)
    new = self.new_from_filename(file)
    @@all << new
  end

  def self.find_or_create_by_name(name)
    found = find_by_name(name)
    if !found
      create(name)
    else
      found
    end
  end

  def self.new_from_filename(file_name)
    instance = file_name.split(" - ")
    song = Song.new(instance[1])

    artist = Artist.find_or_create_by_name(instance[0])
    genre = instance[2].split(".")
    genre = Genre.find_or_create_by_name(genre[0])

    song.artist = artist
    song.genre = genre
    genre.songs << song
    artist.songs << song
    song
  end
end
