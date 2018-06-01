
class Song
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
  end

  def self.all
    @@all
  end
  
    # def save
    #   self.class.all << self
    # end
  
    # def destroy_all
    #   self.all.clear
    # end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end


  def self.new_from_filename(filename)
  	art, sng, raw_gnr = filename.split(" - ")
  	gnr = raw_gnr.gsub(".mp3","")
  	artist = Artist.find_or_create_by_name(art)
  	genre = Genre.find_or_create_by_name(gnr)
  	song = self.new(sng, artist, genre)
  	song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

end


