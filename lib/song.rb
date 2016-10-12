require 'pry'


class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=Artist.new("unknown"), genre=Genre.new("unknown"))
    @name = name
    self.artist= artist
    self.genre = genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def save
    if @@all.include?(self) == false
      @@all << self
    end
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
    file_data = filename.split(/(\s-)/)
    #binding.pry
    song_title = file_data[2].strip
    new_song = Song.find_or_create_by_name(song_title)

    art_name = file_data[0].strip
    new_art = Artist.find_or_create_by_name(art_name)

    genre_name = file_data[4][/^[^.]+/].strip
    new_genre = Genre.find_or_create_by_name(genre_name)
    
    new_art.add_song(new_song)
    new_song.genre=(new_genre)
    new_song
  end

  def self.create_from_filename(filename)
    newbie = new_from_filename(filename)
    newbie.save
    newbie
  end

end

























