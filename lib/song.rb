class Song
  extend Concerns::Memorable::ClassMethods
  extend Concerns::Findable
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name
  attr_reader :artist
  @@all = []

    def initialize(name, artist=nil)
      self.name = name
      if artist != nil
        self.artist = artist
      end
    end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    if artist.songs.include?(self) == false
      artist.add_song(self)
    end
  end
end
