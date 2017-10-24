class Artist
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

  def add_song(song)
    if !(@songs.find {|old_song| old_song == song})
      @songs << song
    end
    if song.artist == nil
      song.artist=(self)
    end
  end

  def genres
    return_array = []
    @songs.each do |song|
      return_array << song.genre
    end
    return_array.uniq
  end
end
