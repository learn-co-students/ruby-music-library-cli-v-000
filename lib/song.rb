class Song
  extend Concerns::Memorable::ClassMethods
  extend Concerns::Findable
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

    def initialize(name, artist=nil, genre=nil)
      self.name = name
      if artist != nil
        self.artist=(artist)
      end
      if genre != nil
        self.genre=(genre)
      end
    end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    if artist.songs.include?(self) == false
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
    song = Song.new(filename.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name (filename.split(" - ")[0])
    song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].split(".")[0])
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end
end
