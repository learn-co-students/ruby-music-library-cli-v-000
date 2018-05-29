class Genre
  attr_reader :name, :songs

  def initialize(name)
    @name = name
    @songs = []
    @@all = []
  end
end