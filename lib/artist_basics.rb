
class Artist

  extend Concerns::Findable
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    super
    @songs = []
  end

  def self.all
    @@all
  end

  def genres
    array = []
    array = songs.collect {|a| a.genre}
    array.uniq
  end

  def add_song(song)
    if !@songs.detect{|a| a == song}
      @songs << song
    end
    if !song.artist
      song.artist = self
    end
  end

end
