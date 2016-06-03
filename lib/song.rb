class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
	  @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def self.all
	  @@all
  end

  def self.destroy_all
  	all.clear
  end

  def save
  	@@all << self
  end

  def self.create(name)
  	song = Song.new(name)
  	song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def self.new_from_filename(file)
    data = file.split(" - ")
    song = self.new(data[1])
    song.artist = Artist.find_or_create_by_name(data[0])
    song.genre = Genre.find_or_create_by_name(data[2].chomp(".mp3"))
    song
  end

  def self.create_from_filename(file)
    new_from_filename(file).save.first
  end

  def to_s
    "#{artist.name} - #{name} - #{genre.name}"
  end
  
end

