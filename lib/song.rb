class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  extend Concerns::Findable

  def initialize(name, artist=nil, genre = nil)
    self.name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    Song.new(name).tap do |song|
      song.save
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    filename.chomp!(".mp3")
    song_array = filename.split(" - ")
    song_artist = song_array[0]
    song_name = song_array[1]
    song_genre = song_array[2]
    song = Song.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(song_artist)
    song.genre = Genre.find_or_create_by_name(song_genre)
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end


end
