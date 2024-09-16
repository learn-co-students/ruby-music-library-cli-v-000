class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end


  def save
    @@all << self
  end

  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

  def self.all
    @@all
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name)? find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
    file_parts = filename.chomp(".mp3").split(" - ")
    song = find_by_name(file_parts[1])
    if !song
      song = Song.new(file_parts[1])
    end
    song.artist = Artist.find_or_create_by_name(file_parts[0])
    song.genre = Genre.find_or_create_by_name(file_parts[2])
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save if song
  end
end
