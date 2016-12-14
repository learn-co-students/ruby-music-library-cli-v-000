class Genre
  extend Concerns::Findable
  include Concerns::InstanceMethods
  
  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    super
    @songs = []
  end

  def add_song(song)
    if song.genre == nil
      song.genre = self
    end
    @songs << song unless @songs.include?(song)
  end

  def artists
    artists = @songs.collect { |song| song.artist }
    artists.uniq    
  end

end