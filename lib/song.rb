class Song

  @@all = []

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    if artist == nil && genre == nil
      @name = name
      @artist = artist
      @genre = genre
    elsif genre == nil
      @name = name
      self.artist = artist
    else
      @name = name
      self.artist = artist
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
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist unless self.artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre unless self.genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.print_song_names
    self.all.each {|song| puts song.name}
  end

  def self.new_from_filename(file_name)
    artist, name, genre = file_name.split(" - ")
    new_song = self.find_or_create_by_name(name)
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song.genre = Genre.find_or_create_by_name(genre.chomp(".mp3"))
    new_song
    #binding.pry
  end

  def self.create_from_filename(file_name)
    saved_song = self.new_from_filename(file_name)
    saved_song.save
    saved_song
  end

end
