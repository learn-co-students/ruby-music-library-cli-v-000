require_relative './concerns/findable'

 class Genre

   attr_accessor :name, :artist, :song

   extend Concerns::Findable

   @@all = []

   def initialize(name)
    @name = name
    @songs = []
   end

   def self.all
    @@all
   end

   def save
    @@all << self
   end

   def songs
    @songs
   end

   def self.destroy_all
    @@all = []
  end

  def artists
   artists = []
   self.songs.map { |song| artists << song.artist }
   artists.uniq
  end

 end
