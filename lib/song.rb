require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
  end
=begin
  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    detected = self.all.detect {|song| song.name == name}
    if detected
      return detected
    else
      self.create(name)
    end
  end
=end
  def artist=(artist)
    @artist = artist
    artist.songs << self #ask question, why need both VVV
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre

    genre.songs << self unless genre.songs.include?(self)

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
    song.save
    song
  end


end
