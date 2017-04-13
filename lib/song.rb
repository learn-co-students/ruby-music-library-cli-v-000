class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def artist=(artist)
    artist.add_song(self) unless artist.songs.include?(self)
    @artist = artist
  end

  def genre=(genre)
    genre.add_song(self) unless genre.songs.include?(self)
    @genre = genre
  end

  def save
    (@@all << self; self) unless @@all.include?(self)
  end

  def self.create(name)
    Song.new(name).tap{|new_song| new_song.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    artist_name, song_name, song_genre = MusicImporter.file_shredder(filename).values

    self.new(song_name).tap do |song|
      new_artist = Artist.find_or_create_by_name(artist_name)
      new_artist.add_song(song)
      new_genre = Genre.find_or_create_by_name(song_genre)
      new_genre.add_song(song)
    end
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end

  # def self.find_by_name(name)
  #   self.all.detect{|song| song.name == name}
  # end
  #
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  # end

end
