class Song
  include Concerns::InstanceMethod
  extend Concerns::ClassMethod, Concerns::Findable
  attr_accessor :name, :artist, :genre
  attr_reader
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end
  
  def self.new_from_filename(filename)
    file = filename.split(" - ")
    self.new(
      file[1], 
      Artist.find_or_create_by_name(file[0]), 
      Genre.find_or_create_by_name(file[2].chomp(".mp3"))
      )
  end
  
  def self.create_from_filename(file)
    self.new_from_filename(file).tap do |song|
      song.save
    end
  end
end