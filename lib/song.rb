class Song
  extend Concerns::Findable

  attr_accessor :name, :save, :create, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|s| s.save}
  end

  def self.new_from_filename(file_name)
    music_array = file_name.chomp('.mp3').split(" - ")
    song = self.new(music_array[1], Artist.find_or_create_by_name(music_array[0]),Genre.find_or_create_by_name(music_array[2]))
  end

  def self.create_from_filename(file_name)
    @@all << new_from_filename(file_name)
  end

  # def self.find_by_name(name)
  #   all.detect do |song|
  #     song.name == name
  #   end
  # end
  #
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) || self.create(name)
  # end

end
