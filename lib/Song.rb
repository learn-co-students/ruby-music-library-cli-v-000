
class Song
  extend Concerns::Findable
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_reader :artist, :genre, :name

  @@all = []

  def self.all
    @@all
  end


  def self.new_from_filename(filename)
    new_artist, new_song, new_genre = filename.split(" - ")
    new_genre = new_genre.split(".")[0]
      new_artist  =  Artist.find_or_create_by_name(new_artist)
      new_genre   =  Genre.find_or_create_by_name(new_genre)
        song = Song.new(new_song, new_artist, new_genre)
    end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end





#==========InstanceMethods=======================================

  def initialize(name, artist=nil, genre=nil)

    @name = name
     if artist!=nil
       self.artist=artist
     end

     if genre!=nil
       self.genre=genre
     end
  end


  def artist=(artist)
    @artist=artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !@genre.songs.detect{|obj| obj == self}
      @genre.songs << self
    end
  end


end
