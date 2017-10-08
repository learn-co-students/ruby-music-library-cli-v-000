class Genre
  extend Concerns::Findable
  extend Concerns::Persistable
  include Concerns::Persistable::InstanceMethods

  attr_accessor :name
  attr_reader :songs
  @@all = []

  def self.all
    @@all
  end

  def artists
    artists = songs.collect { |song| song.artist }
    artists.uniq
  end

end
