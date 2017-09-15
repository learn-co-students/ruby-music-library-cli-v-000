
class Song
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist= nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.all
    @@all.uniq
  end

  def save
    @@all << self unless @@all.include?(self)
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist=nil, genre=nil)
    new_song = Song.new(name, artist, genre)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(file_name)
    song_data =file_name.split(".mp3")[0].split(" - ")

    new_song = self.new(song_data[1])
    new_song.artist = Artist.find_or_create_by_name(song_data[0])
    new_song.genre = Genre.find_or_create_by_name(song_data[2])
    new_song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end

end
