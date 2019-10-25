class Song
  @@all = []
  attr_accessor :name, :artist, :genre
  extend Concerns::ClassMethods
  extend Concerns::Findable
  include Concerns::InstanceMethods

  def initialize(name, artist= nil, genre= nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
  end

  def self.all
    @@all
  end

  def artist=(artist)
    if artist != nil
      if !(artist.songs.find {|song| song == self})
        artist.add_song(self)
      end
    end
    @artist = artist
  end

  def genre=(genre)
    if genre != nil
      if !(genre.songs.find {|song| song == self})
        genre.songs << self
      end
    end
    @genre = genre
  end

  def self.new_from_filename(filename)
    parsed_filename = filename.split(" - ")
    new_artist = Artist.find_or_create_by_name(parsed_filename[0])
    genre_parse = parsed_filename[2].split(".")
    new_genre = Genre.find_or_create_by_name(genre_parse[0])
    new_song = Song.new(parsed_filename[1], new_artist, new_genre)
    new_song
  end

  def self.create_from_filename(filename)
    Song.new_from_filename(filename).save
  end
end
