require_relative '../config/environment'

class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

########## Instance Methods ##########
  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if !song.is_a?(Song) #prompts user with error is the song is not an instance of the Song class
      # begin
        raise SongTypeError
      # rescue SongTypeError => error
      #   puts error.message
      # end
    else
      songs << song unless songs.include?(song) #adds song to artist's song array unless it's already in there
      song.artist = self unless song.artist == self #associates the song with this artist unless the association is already there
    end
  end

  def save #save artist to the class array of artists
    self.class.all << self
  end

  def genres #returns an array of all the unique genres associated to the songs in the artist's song array
    self.songs.collect {|song| song.genre}.uniq
  end

  ########## Class Methods ##########

  def self.all
    @@all
  end

  def self.create(name) #creates AND saves new artist instance
    Artist.new(name).tap {|new_instance| new_instance.save}
  end

end

class SongTypeError < StandardError
  def message
    "Cannot add a non-Song type object."
  end
end


# jayz = Artist.create('jayz')
# binding.pry
# jayz.add_song(new_song)
# jayz.add_song('new_song')
# puts jayz.songs.each {|song| puts song.name}
