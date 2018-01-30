class Genre
  extend Concerns::Memorable::ClassMethods
  extend Concerns::Findable
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

  def artists
    artists = self.songs.collect {|song| song.artist}
    artists.uniq
  end

  def list_songs
    self.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def self.list
    self.all.each {|genre| puts "#{genre.name}"}
  end
end
