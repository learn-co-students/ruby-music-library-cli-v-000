class Song
  extend Concerns::Memorable::ClassMethods, Concerns::Findable
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  @@all=[]
  def initialize(name, artist=nil, genre=nil)
    self.name=name
    self.artist=artist if artist
    self.genre=genre if genre
  end
  def self.new_from_filename (filename)
    names= filename.split(" - ")
    artist_name = names.first
    song_name = names[1]
    genre_name = names[2][0..-5]
    artist= Artist.find_or_create_by_name(artist_name)
    genre= Genre.find_or_create_by_name(genre_name)
    self.new(song_name,artist, genre)
  end
  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song

  end
  def artist= (artist)
    @artist=artist
    artist.add_song(self)
  end
  def genre= (genre)
    @genre=genre
    genre.add_song(self)
  end
  def self.all
    @@all
  end

end
