class Song
  attr_accessor :name, :artist, :song, :genre, :filename
  extend Concerns::Findable
  include Concerns::Findable
  @@all = []


  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) unless artist.nil?
    self.genre=(genre) unless genre.nil?
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
     self.new(name)

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.destroy_all
      @@all.clear
  end

  def self.new_from_filename(filename)
    art, songname, gen = filename.chomp(".mp3").split(" - ")
    song = find_or_create_by_name(songname)
    song.artist=(Artist.find_or_create_by_name(art))
    song.genre=(Genre.find_or_create_by_name(gen))
    song
  end

  def self.create_from_filename(filename)
    nsong = new_from_filename(filename)
    #nsong.save
  end

end
