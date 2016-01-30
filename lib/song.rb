class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    artist.add_song(self) unless artist.nil?
    @genre = genre
    genre.songs << self unless genre.nil?
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include? self
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song = Song.new(song_array[1])
    song.artist = Artist.find_or_create_by_name(song_array[0])
    song.genre = Genre.find_or_create_by_name(song_array[2].gsub(".mp3",""))
    return song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    return song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = @@all.detect {|song| song.name == name}
    if song
      return song
    else
      return song = Song.create(name)
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

end