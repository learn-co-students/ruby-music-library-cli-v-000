require_relative "concerns/findable.rb"

class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_accessor :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
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
    genre.add_song(self)
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.new_from_filename(filename)
    parts = filename.split(' - ')
    artist = parts[0]
    title = parts[1]
    genre = parts[2].chomp('.mp3')
    song = self.find_or_create_by_name(title)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.alphabetical_songs
    i = 1
    song_list = []
    @@all.each do |song|
      song_list << song.name
    end
    song_objects = []
    song_list.sort.collect do |song|
      self.find_by_name(song)
    end
  end

end
