class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    self.new(name).save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  #def self.find_by_name(name)
  #  self.all.find{|songs| songs.name == name}
  #end
  #
  #def self.find_or_create_by_name(name)
  #  self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  #end

  def self.new_from_filename(file_name)
    artist, song, genre = file_name.chomp(".mp3").split(' - ')
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    self.new(song, artist, genre)
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end


end
