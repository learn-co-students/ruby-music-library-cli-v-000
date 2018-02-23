
class Song
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []


  def self.all
   @@all
  end

  def initialize(name, artist = nil, genre = nil)
   @name = name
   self.artist = artist unless artist == nil
   self.genre = genre unless genre == nil
  end

  def artist=(artist)
    @artist = artist unless @artist == self
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre unless @genre == self
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    file = filename.chomp(".mp3").split(" - ")
    song = self.new(file[1], Artist.find_or_create_by_name(file[0]), Genre.find_or_create_by_name(file[2]))
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
end
