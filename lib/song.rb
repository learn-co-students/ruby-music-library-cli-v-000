require_relative "concerns/concerns.rb"
class Song
  extend Concerns::Findable
  extend Concerns::ClassMethods
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if(!artist.nil?)
      @artist = artist
      @artist.add_song(self)
    end
    if(!genre.nil?)
      @genre = genre
      @genre.add_song(self)
    end
  end

  def artist=(artist)
    @artist = artist
    if(!@artist.songs.include?(self))
      @artist.add_song(self)
    end
  end
  def genre=(genre)
    @genre = genre
    if(!@genre.songs.include?(self))
      @genre.add_song(self)
    end
  end
  def save
    self.class.all << self
  end
  def self.all
    @@all
  end
  def self.create(name, artist = nil, genre = nil)
    self.new(name,artist,genre).tap{|s| s.save}
  end
  def self.new_from_filename(file_name)
    split = file_name.split(" - ")
    Song.new(split[1]).tap do |song|
      song.artist = Artist.find_or_create_by_name(split[0])
      song.artist.add_song(song)
      song.genre = Genre.find_or_create_by_name(split[2].gsub(".mp3",""))
    end
  end
  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).tap{|song| song.save}
  end
  def self.destroy_all
    self.all.clear
  end
end
