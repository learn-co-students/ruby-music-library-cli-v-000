class Song

  extend Concerns::Findable
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []
  
  def initialize (name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

    def self.new_from_filename(filename)
      split_file = filename.gsub(".mp3", "").split(" - ")
      artist = Artist.find_or_create_by_name(split_file[0])
      genre = Genre.find_or_create_by_name(split_file[2])
      self.new(split_file[1], artist, genre)
    end

    def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      song.save
    end
end
