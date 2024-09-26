require_relative "concerns/findable.rb"

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def self.create(name)
    Song.new(name).tap do |song|
      song.save
    end
  end

  def self.sort
    @@all.sort_by {|obj| obj.name}
  end

  def description
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

  def name
    @name
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self) unless @genre.songs.include?(self)
  end

  def artist_name
    if @artist
      self.artist.name
    else
      nil
    end
  end

  def save
    if !@@all.include?(self)
      @@all << self
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(file_name)
    data = file_name.gsub(".mp3", "").split(" - ")
    find_or_create_by_name(data[1]).tap do |song|
      song.artist = Artist.find_or_create_by_name(data[0])
      song.artist.add_song(song)
      song.genre = Genre.find_or_create_by_name(data[2])
    end
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name).tap do |song|
      song.save
    end
  end
end
