class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
   @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    artist.add_song(self) unless artist.nil?
    genre.add_song(self) unless genre.nil?
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)  unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def save
    @@all << self unless @@all.include?(self)
  end

  def self.create(name)
    self.new(name).tap {|song| song.save}
  end

  def self.new_from_filename(filename)
    artist, song, genre = filename.gsub('.mp3', '').split(" - ")
    self.new(song).tap do |n_song|
      n_song.genre_type=(genre)
      n_song.artist_name=(artist)
      n_song.save
    end
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def genre_type=(name)
    self.genre = Genre.find_or_create_by_name(name)
    genre.save
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.save
  end
end