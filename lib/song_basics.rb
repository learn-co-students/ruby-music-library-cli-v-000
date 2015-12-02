require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    if @artist != nil
      @artist.songs << self
    end
    @genre = genre
    if @genre != nil
      @genre.songs << self
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

  def self.create(song)
    new_song = self.new(song)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !@genre.songs.include?(self)
      @genre.songs << self
    end
  end

  def self.find_by_name(song)
    self.all.find {|i| i.name == song}
  end

  def self.find_or_create_by_name(song)
    if find_by_name(song) == false
      self.create(song)
    end
  end

  def self.new_from_filename(file)
    new_song = file.sub(/(.mp3)/, '').split(" - ")
    singer = Artist.find_or_create_by_name(new_song[0])
    title = new_song[1]
    type = Genre.find_or_create_by_name(new_song[2])
    self.new(title, singer, type)
  end

  def self.create_from_filename(file)
    new_song = new_from_filename(file)
    new_song.save
    new_song
  end
end








