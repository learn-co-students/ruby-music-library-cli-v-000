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

  def add_song(song)
    if !song.is_a?(Song)
      # begin
        raise SongTypeError
      # rescue SongTypeError => error
      #   puts error.message
      # end
    else
      songs << song
      song.genre = self if song.genre != self
    end
  end

  def save
    self.class.all << self
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

  ########## Class Methods ##########

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end


  def self.create(name)
    Genre.new(name).tap {|new_instance| new_instance.save}
  end

end
