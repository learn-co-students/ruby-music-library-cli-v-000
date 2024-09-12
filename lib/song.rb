require 'pry'

class Song

  extend Concerns::Findable

  attr_accessor :artist, :name
  attr_reader  :genre

  @@all = []
  @@songs = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    if artist !=nil
      self.artist = artist
      @artist.add_song(self)
    end
    if genre !=nil
      self.genre = genre
      @genre.add_song(self)
    end

  end

  def self.all
    @@all
  end

  def self.songs
    @@songs
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Song.new(name).tap {|song| song.save}
  end

  def artist= (artist)
    @artist = artist
    artist.add_song(self)
    artist
  end

  def genre= (genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(file_name)
    filedata = file_name.split(/ - |[.]/)
    self.new(filedata[1]).tap do |song|
      artist = Artist.find_or_create_by_name(filedata[0])
      genre = Genre.find_or_create_by_name(filedata[2])
      song.artist = artist
      song.genre = genre
    end
  end

  def self.create_from_filename(file_name)
      filedata = file_name.split(/ - |[.]/)
      # binding.pry
      self.create(filedata[1]).tap do |song|
        artist = Artist.find_or_create_by_name(filedata[0])
        genre = Genre.find_or_create_by_name(filedata[2])
        song.artist = artist
        song.genre = genre
        @@songs << "#{filedata[0]} - #{filedata[1]} - #{filedata[2]}"
      end
    end


end
