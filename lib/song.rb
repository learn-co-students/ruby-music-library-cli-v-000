class Song
attr_accessor :name
attr_reader :artist, :genre

extend Concerns::Findable

@@all = []

  def self.all
    @@all
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def self.create(name)
     song = Song.new(name)
     song.save
     song
   end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  # def artist(song)
  #   song.artist = self
  #   artist
  # end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  # def self.find_by_name(song)
  #   @@all.find {| s | s.name == song}
  # end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    new_song = filename.split(" - ")
    song_artist = new_song[0]
    song_name = new_song[1]
    song_genre = new_song[2].chomp(".mp3")
    a = Artist.find_or_create_by_name(song_artist)
    g = Genre.find_or_create_by_name(song_genre)
    self.new(song_name, a, g)
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end

end
