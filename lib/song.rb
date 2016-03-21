class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    artist.add_song(self) unless artist == nil
    genre.add_song(self) unless genre == nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(file_name)
    info = file_name.split(" - ")
    if  self.find_by_name(info[1]) == nil
      new_song = Song.create(info[1])
      new_song.artist = Artist.find_or_create_by_name(info[0])
      new_song.genre = Genre.find_or_create_by_name(info[2].slice!(0..4))
      new_song
    else
      self.find_by_name(info[1])
    end
  end

  def self.create_from_filename(file_name)
    info = file_name.split(" - ")
    new_song = Song.find_or_create_by_name(info[1])
    new_song.artist = Artist.find_or_create_by_name(info[0])
    new_song.genre = Genre.find_or_create_by_name(info[2].slice!(0..4))
    new_song
  end


end