class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    Artist.new(artist)
    @artist.add_song(self)
  end

  def genre=(genre)
    genre.songs << self if !genre.songs.include?(self)
    @genre = genre
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  # def self.find_by_name(name)
  #   @@all.detect{|song| song.name == name}
  # end
  #
  # def self.find_or_create_by_name(name)
  #   search = self.find_by_name(name)
  #   if !search
  #     self.create(name)
  #   else
  #     search
  #   end
  #
  # end

  def self.new_from_filename(filename)
    noext =  File.basename(filename, ".*").split(" - ")
    song.name = "#{noext[1]}"
    song.artist_name = "#{noext[0]}"
    song = self.new(song_name)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
