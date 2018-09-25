require_relative "./concerns/findable.rb"
require_relative "./concerns/sortable.rb"

class Song
  extend Concerns::Findable
  extend Concerns::Sortable

  @@all = []
  
  attr_accessor :name
  attr_reader :artist, :genre

  def artist_name
    artist.name
  end

  def genre_name
    genre.name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    self.new(name).save
  end

  def self.new_from_filename(filename)
    artist, name, genre = filename.split(" - ")
    find_or_create_by_name(name).tap do |song|
      song.artist = Artist.find_or_create_by_name(artist)
      song.genre = Genre.find_or_create_by_name(genre.chomp(".mp3"))
    end
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def save
    self.tap { |instance| instance.class.all << self }
  end
end
