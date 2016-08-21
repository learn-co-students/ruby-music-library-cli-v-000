class Song
  extend Concerns::Findable

  @@all = []

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist.nil? == false
      self.artist = artist
    end
    if genre.nil? == false
      self.genre = genre
    end
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def artist=(artist)
    @artist = artist
    if artist.songs.include?(self) == false
      artist.add_song(self)
    end
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.list_songs
    song_list = []
    self.all.each do |song|
      song_list << "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    song_list.sort!
    song_list
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(filename)
    names = filename.scan(/(.*) - (.*) - (.*).mp3/).flatten
    artist = Artist.find_or_create_by_name(names[0])
    genre = Genre.find_or_create_by_name(names[2])
    song = self.new(names[1])
    song.artist = artist
    song.genre = genre
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
end
