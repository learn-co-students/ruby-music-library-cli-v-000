class Genre

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []
  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
     artists = []
     @songs.each do |song|
     artists << song.artist
    end
    artists.uniq
  end


end
