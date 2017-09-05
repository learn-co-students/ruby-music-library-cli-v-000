require 'pry'
class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []
    # Instance Methods

  def initialize(name, artist=nil, genre=nil)
    self.name = name
    artist.eql?(nil) ? self : self.artist = artist
    genre.eql?(nil) ? self : self.genre = genre
  end

  def save
    self.class.all << self
  end
  def genre=(genre)
    @genre = Genre.find_or_create_by_name(genre)
    self.genre.songs << self unless self.genre.songs.include?(self)
  end

  def artist=(artist)
      @artist = Artist.find_or_create_by_name(artist)
      self.artist.add_song(self) unless self.artist.songs.include?(self)
  end

  # Class Methods
  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = Song.new(name).tap{|s| s.save}
  end

  def self.new_from_filename(file_name)
    song_array = file_name.split(" - ")
    if Song.find_by_name(song_array[1]) == nil  # NEW SONG INSTANCE WITH NAME
      new_song = Song.new(song_array[1], song_array[0], song_array[2].gsub(/\W(...)\z/,""))
    else
      Song.find_by_name(song_array[1])
    end
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    new_song.save
  end

end  # End of Class
