require_relative '../config/environment'

class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

########## Instance Methods ##########
  def initialize(name, artist=nil, genre=nil)
    @name = name
    @songs = []
  end

  def add_song(song) #adds song to genre's song array and associates self as song's genre IF song is an instance of the Song class
    if !song.is_a?(Song)
      begin
        raise SongTypeError
      rescue SongTypeError => error
        puts error.message
      end
    else
      songs << song
      song.genre = self if song.genre != self
    end
  end

  def save #saves self to array of all genres
    self.class.all << self
  end

  def artists #returns array of artists associatd to songs in the genre's song array
    self.songs.collect {|song| song.artist}.uniq
  end

  ########## Class Methods ##########

  def self.all
    @@all
  end

  def self.create(name) #creates AND saves genre
    Genre.new(name).tap {|new_instance| new_instance.save}
  end

end
