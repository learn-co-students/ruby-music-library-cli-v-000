class Genre
  include Concerns
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @all << self
  end

  def destroy_all
    @all.clear
  end

  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end

  def artists
    @songs.collect do |song|
      song.artist
    end
  end
end
