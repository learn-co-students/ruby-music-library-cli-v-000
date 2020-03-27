class Song
  extend Concerns::Findable

  @@all = []
  attr_accessor :name, :genre
  attr_reader   :artist

  def initialize(song_name, artist=nil, genre=nil)
    @name = song_name
    self.artist = artist if artist
    self.genre  = genre if genre
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(song_name)
    Song.new(song_name).tap{|s| s.save}
  end

  def self.new_from_filename(filename)
    data = filename.gsub('.mp3', '').split(' - ')
    song = data[1]
    artist = Artist.find_or_create_by_name(data[0])
    genre  = Genre.find_or_create_by_name(data[2])

    Song.new(song, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap{|s| s.save}
  end

end
