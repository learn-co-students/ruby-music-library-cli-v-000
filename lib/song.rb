class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
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

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
    filenames = filename.scan(/(.*) - (.*) - (.*).mp3/).flatten
    artist = Artist.find_or_create_by_name(filenames[0])
    genre = Genre.find_or_create_by_name(filenames[2])
    song = self.new(filenames[1])
    song.artist = artist
    song.genre = genre
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.list_songs
    song_list = []
    self.all.each do |song|
      song_list << "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    song_list.sort!
    song_list
  end
end
