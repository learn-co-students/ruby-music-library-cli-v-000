class Song
  #extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = [ ]

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.create(name)
    new(name).tap{|song| song.save}
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    #song = self.new
    filename = filename.split(" - ")
    artist_name = filename[0]
    song_name = filename[1]
    genre_name = filename[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    #song = self.new
    new_from_filename(filename).tap {|file| file.save }
  end



  def to_string
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

end
