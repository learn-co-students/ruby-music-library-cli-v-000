require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :genre, :artist
  @@all = []

  def initialize(name, new_artist=nil, new_genre=nil)
    @name = name
    self.artist=new_artist
    self.genre = new_genre
  end

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all<<self
  end

  def artist=(art)
    if art.is_a? Artist
      if @artist==nil
        @artist = art
        art.add_song(self)
      end
    else
      puts "Invalid artist"
    end
  end

  def genre=(gen)
    if gen.is_a? Genre
      if @genre==nil
        @genre = gen
        gen.add_song(self)
      end
    end
  end

  def self.new_from_filename(filename)
    corr_filename = filename.gsub(".mp3","").split(" - ")
    new_artist = Artist.find_or_create_by_name(corr_filename[0])
    new_genre = Genre.find_or_create_by_name(corr_filename[2])
    new_song = self.new(corr_filename[1],new_artist, new_genre)
    new_song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end
