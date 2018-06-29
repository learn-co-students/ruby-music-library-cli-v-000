class Genre
  attr_accessor :name, :songs
  
  def initialize(name)
    self.songs = []
  end

end
