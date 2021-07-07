class Artist 
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.create(artist)
    new_artist = new(artist)
    new_artist.save 
    new_artist
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !(songs.include?(song))
      @songs << song
    end
  end 
  
  #   def add_song(song)
  #   song.artist = self unless song.artist
  #   songs << song unless songs.include?(song)
  # end
  
  def genres
    songs.map{ |song| song.genre }.uniq
  end 
end