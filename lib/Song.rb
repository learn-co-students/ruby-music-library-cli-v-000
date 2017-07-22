class Song
  attr_accessor :name
  attr_reader :artist, :genre

  extend Concerns::Findable

  include Concerns::Saveable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.sorted_songs
    self.all.sort{|x, y| x.artist.name <=> y.artist.name}
  end

  def self.new_from_filename(file)
    artist_name, song_name, genre_name = file.gsub('.mp3', '').split(' - ')
    Song.new(
      song_name,
      Artist.find_or_create_by_name(artist_name),
      Genre.find_or_create_by_name(genre_name)
    )
  end

  def self.create_from_filename(file)
    new_from_filename(file).tap{|song| song.save}
  end

end
