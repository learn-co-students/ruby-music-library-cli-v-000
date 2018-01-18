class Song
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    super
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(file)
    song_info = file.split(/\s-\s|\.mp3/)

    self.new( song_info[1],
              Artist.find_or_create_by_name(song_info[0]),
              Genre.find_or_create_by_name(song_info[2])  )
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).tap(&:save)
  end

  def self.all
    @@all
  end

end
