class Song
  @@all = []
  attr_accessor :name
  attr_reader :artist, :genre
  include Common::InstanceMethods
  extend Common::ClassMethods
  extend Concerns::Findable

  def initialize(name, artist=nil, genre=nil)
    super(name)
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) if artist.is_a?(Artist)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.new_from_filename(file)
    components = file.split(" - ")
    song = Song.new(components[1])
    song.artist = Artist.find_or_create_by_name(components[0])
    song.genre = Genre.find_or_create_by_name(components[2].match(/^[^.]+/)[0])
    song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end
end#endof class
