class Genre

attr_accessor :name

@@all = []

  def initialize(kind)
    @name= kind
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(kind)
    genre = Genre.new(kind)
    genre.save
    genre
  end

end
