require 'pry'
class Song
  extend Concerns::Findable

  @@all = []

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
  end


  def self.find_by_name(name)
    @@all.detect{|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(file)
      song_title = file.split(" - ")[1]
      song_artist = file.split(" - ")[0]
      song_genre = file.split(" - ")[2].split('.mp3')[0]
      song_title_instance = Song.new(song_title)
      song_title_instance.artist = Artist.find_or_create_by_name(song_artist)
      song_title_instance.genre = Genre.find_or_create_by_name(song_genre)
      song_title_instance
    end

  def self.create_from_filename(file)
      self.new_from_filename(file)
  end

end
