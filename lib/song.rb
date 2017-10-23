require "pry"
class Song
  extend Concerns::Findable
  extend Concerns::Createdestroy
  include Concerns::Save
  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name

    self.genre = genre if !genre.nil?
    self.artist = artist if !artist.nil? # <-- if there is an artist then create a class and add the artist
  end

  def self.all
    @@all
  end

  def self.new_from_filename(filename)
    file_parse = filename.gsub(".mp3","").split(" - ")
    name = file_parse[1]
    artist = Artist.new(file_parse[0])
    genre = Genre.new(file_parse[2])
    song = Song.new(name,artist,genre)
    artist = Artist.find_or_create_by_name(song.artist)
    genre = Genre.find_or_create_by_name(song.genre)

    return song
  end

  # def self.create_from_filename(filename)
  #   song = self.new_from_filename(filename)
  # end
# binding.pry

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      Genre.create(genre)
      genre.songs << self
    end
  end

end
