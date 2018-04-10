class Genre
  attr_accessor :name
  attr_reader :artist, :song, :songs

  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethod

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
    song.genre = self unless song.genre
  end

  def artists
    @songs.collect do |song|
      song.artist
    end.uniq
  end

end
