class Artist
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
  extend Concerns::Nameable

  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    if !song.artist
      song.artist = self
    end
    
    if !songs.include?(song)
      songs << song
    end
  end
  
  def genres
    songs.collect {|song| song.genre}.uniq
  end
end
