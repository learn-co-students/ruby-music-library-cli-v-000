require 'pry'

class Song

  attr_accessor :name, :artist
  attr_reader :genre

  extend Concerns::Findable
  extend Persistable::ClassMethods
  extend Memorable::ClassMethods
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  include Nameable::InstanceMethods

  @@all = []

def genre=(genre)
  genre.songs << self unless genre.songs.include?(self)
  @genre = genre
end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
  end

  def artist=(artist)
     @artist = artist
     artist.add_song(self)
   end

  def self.all
    @@all
  end

  def self.create(name)
    new(name).tap{|s| s.save}
  end

  def self.new_from_filename(filename)
    s = filename.chomp(File.extname(filename))
    s = s.split(" - ")
    artist = Artist.find_or_create_by_name(s[0])
    genre = Genre.find_or_create_by_name(s[2])
    self.new(s[1], artist, genre)
  binding.pry
  end



end
