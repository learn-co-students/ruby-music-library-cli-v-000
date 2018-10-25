class Song
  attr_accessor :name
  attr_reader :artist, :genre
  
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre) # a reciprocal belongs to
    # Assign that genre to myself
    @genre = genre
    # Be a nice object and tell the genre that it has a new song, me.
    genre.add_song(self)
  end
  
  # def genre=(genre) The last definition always takes precedence
  #   raise "STOP"
  # end
  
  def self.new_from_filename(filename)
    file = filename.chomp(".mp3").split(" - ")
    song = Song.new(file[1])
    song.artist = Artist.find_or_create_by_name(file[0])
    song.genre = Genre.find_or_create_by_name(file[2])
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end