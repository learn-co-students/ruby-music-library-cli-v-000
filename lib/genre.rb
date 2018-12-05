class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs, :artist

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create (name)
    new(name).tap {|g| g.save}
  end

  def artists
    #  artists =  self.songs.collect do |song|
    #     song.artist
    # end
    #   artists.uniq

    songs.map(&:artist).uniq
  end



end
