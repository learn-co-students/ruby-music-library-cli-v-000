class Song
  attr_accessor :name, :artist, :genre

    extend Concerns::Findable

  @@all=[]

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=artist if artist
    self.genre=genre if genre
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

  def self.create(song)
    new_song = self.new(song)
    new_song.save
    new_song
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
    parsed_file = filename.split(" - ")
    artist_name=parsed_file[0]
    song_name=parsed_file[1]
    genre_name=parsed_file[2].gsub(".mp3","")

    artist=Artist.find_or_create_by_name(artist_name)
    genre=Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap {|song| song.save}
  end 




end
