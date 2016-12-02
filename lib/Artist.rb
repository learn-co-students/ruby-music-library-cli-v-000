class Artist
  attr_accessor :name, :songs

  extend Concerns::Findable
  extend NewModules::ClassMethods
  include NewModules::InstanceMethods


  def initialize(name)
    self.class.destroy_all
    @name = name
    @songs = []
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    unless @songs.include?(song)
      @songs << song
    end
  end

  def genres
    collection = []
    @songs.collect do |song|
      collection << song.genre
    end
    collection.uniq
  end

end
