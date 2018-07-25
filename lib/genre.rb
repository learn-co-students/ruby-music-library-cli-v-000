class Genre

attr_accessor :name
attr_reader :songs


@@all = []

  def initialize(name)
    @name= name
    @@all << self
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

  def self.create(name)
    this_genre = Genre.new(name)
    this_genre.save
    this_genre
  end


end
