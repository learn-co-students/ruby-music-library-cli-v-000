class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    Song.new(name).tap {|song| song.save}
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
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(file)
    file_parts = file.split(" - ")
    song = Song.new(file_parts[1], Artist.find_or_create_by_name(file_parts[0]), Genre.find_or_create_by_name(file_parts[2].gsub(".mp3","")))
    song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).tap {|song| song.save}
  end
  
end
