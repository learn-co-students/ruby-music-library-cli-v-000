class Artist
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
      @name = name
      @songs = []
      save
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self if !song.artist
    @songs << song if song.artist == self && !@songs.include?(song)
  end

  def genres
    art_genres = []
    @songs.each{|s| art_genres << s.genre if !art_genres.include?(s.genre)}
    art_genres
  end
end
