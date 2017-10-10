class Song

  attr_accessor :name
  attr_reader :genre, :artist


  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
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
   song = self.new(name)
   self.all << song
   song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else find_by_name(name)
    end
  end

  def artists
    @songs.collect {|s| s.artist}.uniq
  end

  def self.new_from_filename(file)
    title = file.split(" - ")[1]
    artist_name = file.split(" - ")[0]
    genre_name = file.split(" - ")[2].gsub(".mp3","")
    song = self.find_or_create_by_name(title)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end

end
