class Song
  # extend Memorable::ClassMethods
  # include Memorable::InstanceMethods
  # include Paramable
  extend Concerns::Findable

  attr_accessor :name,:artist, :genre


  @@all = []


  def initialize(name, artist = nil, genre = nil, file_name = nil)
     @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
    self.file_name=(file_name) if file_name
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  # def file_name=(file_name)
  #   @file_name = file_name
  #   file_name.add_song(self)
  # end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(file_name)
      song = Song.new(file_name.split(" - ")[1])
      song.artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
      song.genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].delete".mp3")
      song.artist.add_song(song)
      song
    end

  def self.create_from_filename(file_name)
    @@all << self.new_from_filename(file_name)
  end

  # def self.create(name)
  #   song = self.new(name)
  #   song.save
  #   song
  # end

  # def self.find_by_name(name)
  #   @@all.detect do |song|
  #     if song.name == name
  #       return song
  #     end
  #   end
  # end

  # def self.create_by_name(name)
  #   song = self.create
  #   song.name = name
  #   song
  # end

  # def self.find_or_create_by_name(name)
  #  self.find_by_name(name) || self.create(name)
  #  end

end
