class Song
  attr_accessor :name, :genre, :artist
  @@all = []
  extend Concerns::Findable

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre

    artist != nil ? artist.add_song(self) : @name

    genre != nil ? genre.songs << self : @name
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) ? self.genre : genre.songs << self
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

  def self.create(song)
    song = Song.new(song)
    song.save
    song
  end

  def self.new_from_filename(filename)
    song = Song.find_or_create_by_name(filename.split("-")[1].strip)

    song.genre = Genre.find_or_create_by_name(filename.split(" ").last.gsub(".mp3", ""))
    song.genre.songs.clear

    song.artist = Artist.find_or_create_by_name(filename.split("-")[0].strip)


    song
  end

  def self.create_from_filename(filename)
    song = Song.find_or_create_by_name(filename.split("-")[1].strip)

    song.genre = Genre.find_or_create_by_name(filename.split(" ").last.gsub(".mp3", ""))

    song.artist = Artist.find_or_create_by_name(filename.split("-")[0].strip)


    song
  end
end
