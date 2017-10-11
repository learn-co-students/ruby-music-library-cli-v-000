class Song

attr_accessor :name, :genre
attr_reader :artist

  @@all = []
  extend Concerns::Findable

  def initialize(name, artist= nil, genre= nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
     self.all.detect{|song| song.name == name}
   end

   def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create(name)
end

  def genre=(genre)
    @genre = genre
    @genre.songs << self if !@genre.songs.include?(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.new_from_filename(filename)
    artist_name, song_name, genre_name = filename.gsub(".mp3","").split(" - ")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    song = Song.new(song_name, artist, genre)
    song
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
end

end
