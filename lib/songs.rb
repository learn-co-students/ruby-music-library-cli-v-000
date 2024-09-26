
class Song

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artists = nil, genres = nil )
    @name = name
    if artists != nil
      self.artist = artists
    end

    if genres != nil
      self.genre = genres
    end

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
  song_string = filename.split("-")[1].strip
  artist_string = filename.split("-")[0].strip
  genre_string = filename.split(" - ")[-1].split(".")[0].strip

  artist = Artist.find_or_create_by_name(artist_string)
  genre = Genre.find_or_create_by_name(genre_string)

  Song.new(song_string,artist,genre)
  end

  def self.create_from_filename(filename)
    # does the same thing as .new_from_filename but also saves the newly-created song to the @@all class variable.
    new_from_filename(filename).save
  end



end
