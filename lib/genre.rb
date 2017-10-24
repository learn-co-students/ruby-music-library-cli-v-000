class Genre
  @@all = []
  attr_accessor :name, :songs
  extend Concerns::ClassMethods
  extend Concerns::Findable
  include Concerns::InstanceMethods

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def artists
    return_array = []
    @songs.each do |song|
      return_array << song.artist
    end
    return_array.uniq
  end
end
