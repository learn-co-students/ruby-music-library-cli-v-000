class Artist
  extend Concerns::Findable # to add all findable methods as class methods
  extend  Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
     @name = name
     @songs = []
  end

  def self.all
    @@all
  end

  def self.create(name)
     artist = Artist.new(name)
     artist.save
     artist
   end

   def artist=(name)
     @artist = name
     @artist.add_song(self)
   end

   def add_song(song)
     if song.artist != self
     song.artist = self
   end
   if !@songs.include?(song)
     self.songs << song
   end
  end

  def genres
   self.songs.collect {|song| song.genre}.uniq
 end

end
