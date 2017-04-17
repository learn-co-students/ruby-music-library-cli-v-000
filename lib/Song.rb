require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    artist.add_song(self) unless artist == nil
    genre.songs << self unless genre == nil
  end

  def artist=(artist)
    if @artist == nil
      @artist = artist
      @artist.songs << self
      @artist.add_song(self)
    end #여기서 self를 쓰면 무한루프를 돌아.
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song #ㅇ이걸 왜 해야 하지
  end

  def self.new_from_filename(filename)
    filename_arr = filename.split(" - ")
    artist_name = filename_arr[0]
    song_name = filename_arr[1]
    genre_name = filename_arr[2].split(".")[0]

    song = self.new(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(song)
    genre = Genre.find_or_create_by_name(genre_name)
    genre.add_song(song)
    song
  end
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song

  end
  def self.destroy_all
    self.all.clear
  end

end
