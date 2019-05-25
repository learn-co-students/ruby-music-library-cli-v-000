class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  extend Concerns::Findable

  def initialize(song, artist = nil, genre = nil)
    @name = song
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
    save
  end

  def self.all
    @@all.uniq
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) ? genre.songs : genre.songs << self
    #genre.songs << self
  end

  def self.create(song)
    #song = Song.new(name)
    #song.save
    #song
    self.new(song).tap {|song| song.save}
  end

  def self.new_from_filename(file_name)
    file_info = file_name.split(' - ')
    song = Song.new(file_info[1])
    song.artist = Artist.find_or_create_by_name(file_info[0])
    song.genre = Genre.find_or_create_by_name(file_info[2][/[^.]+/])
    song
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name)
  end
end
