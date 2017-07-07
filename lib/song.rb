class Song
  extend Concerns::Findable
  include Concerns::Persistable::InstanceMethods
  extend Concerns::Persistable::ClassMethods
  extend Concerns::Nameable::ClassMethods

  attr_accessor :name, :genre
  attr_reader :artist
  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
  end

  def genre=(genre)
    if genre.class == Genre
      @genre = genre
      genre.songs << self unless genre.songs.include?(self)
    end
  end

  def artist=(artist)
    if artist.class == Artist
      @artist = artist
      artist.add_song(self)
    end
  end

  def self.new_from_filename(filename)
    data = filename.split(/\s-\s|.mp3/)
    self.new(data[1],Artist.find_or_create_by_name(data[0]),Genre.find_or_create_by_name(data[2]))
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap{|o| o.save}
  end

end
