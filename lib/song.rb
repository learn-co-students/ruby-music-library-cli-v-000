class Song
  extend Concerns::Findable

  attr_accessor :name, :songs
  attr_reader :artist, :genre

  def initialize(name, artist="", genre="")
    @name = name
    @songs = []
    @artist = artist unless artist == ""
    @genre = genre unless artist == ""
    artist.songs << self unless artist = ""
    genre.songs << self unless genre = ""
  end

  def artist=(art)
    @artist = art
    art.add_song(self) unless art.songs.include?(self)
  end

  def genre=(gen)
    @genre = gen
    gen.songs << self unless gen.songs.include?(self)
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    art = find_or_create_by_name(array[0])
    gen = find_or_create_by_name(array[2][0..-5])
    new_song = self.find_or_create_by_name(array[1])
    new_song.artist = art
    new_song.genre = gen
    new_song

=begin
    #song= array[1]
    #artist= array[0]
    #genre= array[2][0..-5]
=end
  end

end