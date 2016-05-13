class Song
  extend Concerns::Findable

  attr_accessor :name, :all, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre=nil)
    @name = name
    @artist = artist if artist
    self.artist.add_song(self) if artist && Artist.find_by_name(name) == nil
    @genre = genre if genre
    self.genre.add_song(self) if genre && Genre.find_by_name(name) == nil
    #@@all << self
  end

  def self.create(name, artist = nil, genre=nil)
      new_song = new(name, artist, genre).tap{|s| s.save}
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.add_song(self)
  end

  def self.new_from_filename(file_name)
    file_section = file_name.split(" - ")

    artist = Artist.find_or_create_by_name(file_section[0])
    genre = Genre.find_or_create_by_name(file_section[2].gsub(".mp3", ""))

    self.new(file_section[1], artist, genre)
  end

  def self.create_from_filename(file_name)
    file_section = file_name.split(" - ")

    artist = Artist.find_or_create_by_name(file_section[0])
    genre = Genre.find_or_create_by_name(file_section[2].gsub(".mp3", ""))

    if Song.find_by_name(file_section[1]) == nil
      self.create(file_section[1], artist, genre)
    end

    #song = self.new(file_section[1]) unless Song.all.include?(song)
  end

  def enumerated_file_list
    MusicImporter.new("../bin/musiclibrary").files
  end

end
