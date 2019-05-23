require_relative './concerns/findable.rb'
require_relative './concerns/persistable.rb'
require_relative './concerns/nameable.rb'

class Song
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  extend Nameable::ClassMethods
  attr_accessor :name
  attr_reader :genre, :artist

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !self.genre.songs.include?(self)
      self.genre.songs << self
    end
  end

  def self.new_from_filename(filename)
    artist_name,song,genre_name = filename.split(" - ")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name.gsub(".mp3",""))
    new(song,artist,genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{|s|s.save}
  end

end
